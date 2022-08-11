## Requirement
1. install python3,pip,
2. OS is Ubuntu or Window
## Set username, password in file autoFeedback.robot
- Change 12345...  at line 2 to your username
- Change ******  at line 3 to your password
## Setup for Ubuntu
1. Install virtualenv `python3 -m pip install --user virtualenv`
2. Create env `python3 -m venv env`
3. Activate env `source env/bin/activate`
4. Install library `pip install -r requirements.txt`
5. Run `robot autoFeedback.robot`
6. And wait .................
## Setup for Window
1. Install virtualenv `py -m pip install --user virtualenv`
2. Create env `py -m venv env`
3. Activate env `.\env\Scripts\activate`
4. Install library `pip install -r requirements.txt`
5. Run `robot autoFeedback.robot`
6. And wait .................
7. If fail run `robot autoFeedback.robot` again


