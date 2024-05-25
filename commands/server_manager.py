import json
import time

import requests

import downloader
from .base_command import BaseCommand
from logger import *
import os


class CreateServerCommand(BaseCommand):
    name = "create"
    args_def = [{"name": "서버 이름", "type": str, "required": True},
                {"name": "서버 버전", "type": str, "required": False, "default": "latest"},
                {"name": "서버 구동기", "type": "choice", "choice": ["paper", "vanilla"], "default": "paper",
                 "required": False}]
    alias = ["c", "mk", "new"]

    def execute(self, args):
        directory = args[0]
        try:
            if not os.path.exists(directory):
                os.makedirs(directory)
                info(f"폴더 {directory}를 생성했어요!")
                os.chdir(directory)
            else:
                error("이미 존재하는 폴더에요!")
                return None
        except OSError as e:
            error(f"폴더 {directory} 생성 중에 오류가 발생했어요!", e)
            return None

        with open("eula.txt", "w") as f:
            f.write("eula=true")
        manifest: dict = requests.get("https://launchermeta.mojang.com/mc/game/version_manifest.json").json()

        java_version = None


        if args[2] == "paper":
            versions: list = requests.get("https://api.papermc.io/v2/projects/paper").json()["versions"]
            version = ""
            if args[1] == "latest":
                version = versions[-1]
            if not (version in versions):
                error("존재하지 않는 버전이에요! 페이퍼가 아직 그 버전을 지원하지 않을 수도 있어요!")
                return None
            java_version = requests.get(next((v for v in manifest['versions'] if v['id'] == version), None)["url"]).json()["javaVersion"]["majorVersion"]
            builds = requests.get("https://api.papermc.io/v2/projects/paper/versions/" + version).json()["builds"]
            build = builds[-1]
            downloader.download(f"https://api.papermc.io/v2/projects/paper/"
                                f"versions/{version}/builds/{build}/"
                                f"downloads/paper-{version}-{build}.jar", os.path.join(directory, "server.jar"))
            info("다운로드에 성공했어요!!")
            os.chdir("..")
        else:
            ver = next((v for v in manifest['versions'] if v['id'] == args[1]), None)
            if args[1] == "latest":
                ver = manifest["latest"]["release"]
            if ver is None:
                error("존재하지 않는 버전이에요!")
                return None

            downloader.download(requests.get(ver["url"]).json()["downloads"]["server"]["url"], "server.jar")
            os.chdir("..")
        with open("info.txt", "w") as f:
            data = {
                "type": args[2],
                "version": args[1],
                "creationDate": time.time(),
                "java": java_version
            }
            f.write(json.dumps(data))


class DeleteServerCommand(BaseCommand):
    name = "delete"
    args = [{"name": "서버 이름", "type": str, "required": True}]
    alias = ["d", "rm", "remove"]

    def execute(self, args):
        directory = args[0]
        try:
            if os.path.exists(directory):
                info("정말 삭제하실 건가요? 지우려면 y를 입력해주세요!")
                confirm = input("(y/N) > ")
                if confirm.lower().startswith("y"):
                    info("정말요? 되돌릴 수 없어요!")
                    confirm = input("(y/N) > ")
                    if confirm.lower().startswith("y"):
                        os.removedirs(directory)
                else:
                    info("취소했어요!")
        except OSError as e:
            error(f"폴더 {directory} 삭제 중에 오류가 발생했어요!", e)
