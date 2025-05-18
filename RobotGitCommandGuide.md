# Quick Reference Robot & Git Command Guide

---

# 🤖 Robot Framework Commands

Assuming VS Code terminal is open at the root level, here are the most important Robot Framework CLI commands:

## 🔁 Run All Tests in a Specific File
```bash
robot libraries_tests/1.tests_builtin.robot
```
**Description**: Executes all test cases defined in `1.tests_builtin.robot`.

---

## 📂 Run All Tests in a Folder
```bash
robot libraries_tests
```
**Description**: Runs all `.robot` files in the `libraries_tests` folder.


---

## 🧪 Run a Specific Test Case
```bash
robot -t "1.3 Comparing Conditions" libraries_tests/1.tests_builtin.robot
```
**Description**: Executes only the test case named `"1.3 Comparing Conditions"` from the file.


---

## 📁 Set a Custom Output Directory
```bash
robot -d reports libraries_tests/1.tests_builtin.robot
```
**Description**: Saves output files (logs, reports) into the `reports` directory.


---

## 🏷️ Run by Suite Name
```bash
robot --suite "1.tests Builtin" libraries_tests
```
**Description**: Runs tests only from suites with the specified name (derived from file/folder names).


---

## 🎯 Run by Tag (Include or Exclude)
```bash
robot --include smoke libraries_tests
robot --exclude wip libraries_tests
```
**Description**:  
- `--include`: Runs only tests tagged with the given tag (e.g., `smoke`).  
- `--exclude`: Skips tests tagged with the given tag (e.g., `wip`).


---

## ❓ View All Available Options
```bash
robot --help
```
**Description**: Displays all available command-line options for controlling test execution.



---

# 🛠️ Git Commands

Here are some essential Git commands you'll frequently use.


## 🌐 Clone a Repository
```bash
git clone https://github.com/user/api-tests.git
cd api-tests
```
**Output Example:**
```
Cloning into 'api-tests'...
remote: Enumerating objects: 10, done.
...
Unpacking objects: 100% (10/10), done.
```


---

## 🔄 Switch Branches
```bash
git checkout feature-api-x
```
**Output Example:**
```
Switched to branch 'feature-api-x'
```


---

## 📥 Pull Latest Changes
```bash
git pull origin main
```
**Output Example:**
```
From github.com:user/api-tests
 * branch            main       -> FETCH_HEAD
Updating a1b2c3d..e4f5g6h
Fast-forward
 test_user_api.robot | 2 ++
 ...
```


---

## 📤 Stage All Changes
```bash
git add .
```
**Note:** No output is shown if successful.


---

## 💾 Commit Changes Locally
```bash
git commit -m "Add new tests for user creation endpoint"
```
**Output Example:**
```
[feature-api-x 123abcd] Add new tests for user creation endpoint
 1 file changed, 25 insertions(+)
```


---

## ☁️ Push Changes to Remote Repository
```bash
git push origin
```
**Output Example:**
```
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
...
To github.com:user/api-tests.git
   456efgh..123abcd  feature-api-x -> feature-api-x
```


---

### 📘 Next Steps

For further reading:
- [Robot Framework User Guide](https://robotframework.org/robotframework/)
- [Git Documentation](https://git-scm.com/book/en/v2)



---
