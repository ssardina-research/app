import inspect
import os
import shutil
import zipfile
from enum import Enum, auto
from pathlib import Path


class PathType(Enum):
    PDDL = auto()
    ZIP = auto()
    DIR = auto()
    BINARY = auto()


def create_folder(path: str, delete: bool = False):
    path = os.path.expanduser(path)
    if os.path.exists(path) and delete:
        shutil.rmtree(path)

    os.makedirs(path, exist_ok=True)

def get_file_content(file_path: str):
    info = []
    with open (file_path, 'rt') as f:
        info = f.readlines()

    return [l.strip() for l in info]

def standardize_path(path: str):
    return os.path.realpath(os.path.expanduser(path))

def extract_zip(zip_file: str, folder: str):
    create_folder(folder)
    try:
        with zipfile.ZipFile(zip_file) as z:
            z.extractall(folder)
    except Exception as e:
        raise e

def split_filename(file: str):
    file_name, ext = os.path.splitext(os.path.basename(file))
    return file_name, ext


def get_current_path() -> Path:
    """Get the path to the file where the function is called.
    Source: PDDL python package
    """
    return Path(os.path.dirname(inspect.getfile(inspect.currentframe()))).parent 

def empty_file(file_path: str):
    """
    A file is empty if it does not exist or if it exists but does not have anything
    """
    if not os.path.exists(file_path):
        return True
    with open(file_path) as f:
        info = f.readlines()

    _lines = [_l for _l in info if _l.strip() != ""]
    if len(_lines) == 0:
        return True
    
    return False
