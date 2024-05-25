from logger import error
import re


class BaseCommand:
    name = ""
    alias = []
    args_def = []

    def execute(self, args):
        raise NotImplementedError("서브클래스는 이 메서드를 구현해야 해요!")

    def parse(self, input_args):
        parsed_args = []
        for i, arg_def in enumerate(self.args_def):
            arg_name = arg_def["name"]
            arg_type = arg_def["type"]

            # Check if the argument is provided
            if i < len(input_args):
                value = input_args[i]
                # Validate type
                if arg_type == "choice":
                    if value not in arg_def["choice"]:
                        error(f"{arg_name}은(는) {arg_def['choice']} 중에서 선택해야 하지만 {value}라는 값이 왔어요!")
                        return None
                elif arg_type == str:
                    pass  # str 타입은 별도의 검증이 필요 없음
                elif arg_type == "regex":
                    if not re.match(arg_def["regex"], value):
                        error(f"{arg_name}의 검증이 실패했어요! 올바른 형식인지 확인해주세요")
                        return None
                elif arg_type == int:
                    if not value.isdigit():
                        error(f"{arg_name}은(는) 숫자여야 해요!")
                        return None
                else:
                    raise TypeError(f"Internal Error: {arg_name}는 없는 형식이에요!")
                parsed_args.append(value)
            else:
                # If not provided, use default if available
                if "default" in arg_def:
                    parsed_args.append(arg_def["default"])
                elif arg_def["required"]:
                    error(f"{arg_name}은(는) 필수 입력 사항입니다.")
                    return None

        return parsed_args
