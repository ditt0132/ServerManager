def process_arguments(arg_definitions, args):
    # 결과 리스트 초기화
    result = []

    # 필수 인수 채우기
    required_args = [d["name"] for d in arg_definitions if d["required"]]

    if len(args) < len(required_args):
        print_usage(arg_definitions)
        return None

    # 인수 채우기
    for i, definition in enumerate(arg_definitions):
        name = definition["name"]
        arg_type = definition["type"]

        # 인수가 제공되었는지 확인
        if i < len(args):
            arg = args[i]

            if arg_type == "choice":
                if arg not in definition["choice"]:
                    print_usage(arg_definitions)
                    return None
            elif arg_type == str:
                pass
            else:
                print(f"지원되지 않는 인수 유형: {arg_type}")
                return None

            result.append(arg)
        else:
            # 기본값 또는 None 추가
            if "default" in definition:
                result.append(definition["default"])
            elif definition["required"]:
                print_usage(arg_definitions)
                return None

    return result

def print_usage(arg_definitions):
    usage = "사용법: c"
    for definition in arg_definitions:
        name = definition["name"]
        if definition["required"]:
            usage += f" <{name}>"
        else:
            default = definition["default"]
            choices = f": ({'|'.join(definition['choice'])})" if "choice" in definition else ""
            usage += f" [{name}={default}{choices}]"
    print(usage)  # TODO: OPTIONAL USAGE
