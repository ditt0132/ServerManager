import zipfile
import os
import downloader
from .base_command import BaseCommand
from logger import *


class ApplyMapCommand(BaseCommand):
    name = "map"
    args = [{"name": "서버 이름", "type": str, "required": True},
            {"name": "맵 주소", "type": str, "required": True}]
    alias = ["m", "applymap", "loadmap"]

    def execute(self, args):
        if not os.path.exists(args[0]):
            error(f"{args[0]}라는 이름의 폴더가 없어요!")
        os.chdir(args[0])
        downloader.download(args[1], "map.tmp.zip")
        try:
            with zipfile.ZipFile("map.tmp.zip", "r") as mf:
                mf.extractall("world")
        except IOError as e:
            error(f"파일 압축 해제 중 에러가 발생했어요: {e}")
        finally:
            if os.path.exists("map.tmp.zip"):
                os.remove("map.tmp.zip")
            os.chdir("..")


class ResetMapCommand(BaseCommand):
    name = "resetmap"
    args = [{"name": "서버 이름", "type": str, "required": True}]
    alias = ["reset", "deletemap", "removemap", "delmap"]

    def execute(self, args):
        info("정말 맵을 리셋하실건가요?")
        info("삭제된 맵은 되돌릴 수 없어요!")
        if input("(y/N) > ").lower().startswith("y"):
            info("정말로요?")
            if input("(y/N) > ").lower().startswith("y"):
                info("서버 맵을 폭파할게요...")
                os.remove("world")
                os.remove("world_nether")
                os.remove("world_the_end")
                return None
        info("삭제를 취소했어요!")
