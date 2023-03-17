@ECHO OFF &:: Clean output and hide path of running command

ECHO **** Python ****
winget install Python.Python.3.11
python --version

ECHO **** pip ****
python -m ensurepip --upgrade --user
python -m pip install --upgrade --user pip
python -m pip --version
pip -V

ECHO **** Python global user packages via PIP ****
python -m pip install --upgrade --user setuptools
:: Virtual environments with Pipenv
python -m pip install --upgrade --user pipenv
pipenv --version
MKLINK /J "%USERPROFILE%\.virtualenvs" "%USER_BAK%\.virtualenvs"
:: Automatically format code to conform to the PEP 8 style guide in VSCode
python -m pip install -U --user autopep8
:: HTTP/HTTPS requests
python -m pip install --upgrade --user requests
:: MPV subtitles script requirement
python -m pip install --upgrade --user subliminal
:: GoldenDict's Google Translate integration
python -m pip install --upgrade --user google-translate-for-goldendict
:: Jupyter notebooks. Run with "jypyter notebook" or "py -m notebook"
python -m pip install --upgrade --user notebook

