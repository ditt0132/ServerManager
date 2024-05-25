import requests
import os
from logger import *

from tqdm import tqdm


BAR_FORMAT = '\033[0m[{bar}] | {n_fmt}/{total_fmt} [{percentage:.2f}%] {rate_fmt}{postfix}'


def download(url, output_path: os.PathLike | str):
    response = requests.get(url, stream=True)
    total_size = int(response.headers.get('content-length', 0))
    block_size = 1024  # 1 Kilobyte
    wrote = 0

    with open(output_path, 'wb') as file, tqdm(
            total=total_size, unit='B', unit_scale=True, unit_divisor=1024,
            bar_format=BAR_FORMAT, ncols=80, ascii=".="
    ) as progress_bar:
        for data in response.iter_content(block_size):
            wrote += len(data)
            file.write(data)
            progress_bar.update(len(data))

    if total_size != 0 and wrote != total_size:
        error("뭔가 잘못됐어요!")
