import os

from commands import get_command
from logger import *


def main():
    if not os.path.exists("eula"):
        info("EULA에 동의해주세요!")
        info("https://aka.ms/MinecraftEULA/")
        if input("(Y/n) > ").lower() == "y":
            with open("eula", "w") as f:
                f.write("true")
        else:
            info("EULA를 동의하지 않을 경우 이 프로그램을 사용할 수 없어요")
            input("Enter 키를 눌러서 종료해주세요!")
            exit(0)
        info("Minecraft Server Manager")
    while True:
        try:
            command_parts = input("> ").strip().split()
            if len(command_parts) == 0:
                continue
            name = command_parts[0]
            args = command_parts[1:]

            if name == "exit":
                break

            command = get_command(name)
            if command:
                parsed = args  # command.parse(args)
                if parsed is None:
                    continue
                command.execute(parsed)
            else:
                warn(f"없는 커맨드입니다: {name}")

        except KeyboardInterrupt:
            print("종료하시려면 exit를 사용해주세요!")


if __name__ == "__main__":
    main()
