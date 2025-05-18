# Useful Quick Reference Guide

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


## ✅ Bonus - Common `${response}` Attributes in Robot Framework (`RequestsLibrary`)

This table outlines the most frequently used attributes when working with response objects from HTTP requests in Robot Framework using the `RequestsLibrary`.

| Attribute                 | Description                                                   | Example Use                                                                 |
|--------------------------|---------------------------------------------------------------|------------------------------------------------------------------------------|
| `${response.status_code}` | The HTTP status code returned by the server                   | `Should Be Equal As Integers    ${response.status_code}    200`             |
| `${response.text}`        | Response body as a string (usually JSON or plain text)        | `Should Contain    ${response.text}    "inmateId"`                           |
| `${response.json()}`      | Parses* the body as a JSON object (requires \`Evaluate\`)       | `${json}=    Evaluate    ${response.json()}    json`                         |
| `${response.headers}`     | Dictionary of response headers                                | `Should Contain    ${response.headers['Content-Type']}    application/json` |
| `${response.content}`     | Raw response content in bytes                                 | Useful for binary data or file downloads                                    |


---


## ✅ **Most Used in Practice**

For **day-to-day API testing**, these are the top 3 you'll use:

1. `status_code` → for validating response success or error
2. `json()` → for checking specific fields (requires `Evaluate`)
3. `headers` → for content type, authentication, etc.


---


### **💡 Tip:** To parse JSON once and reuse:

**Parsing** = interpreting structured text (like JSON) and turning it into a structured object (like a dictionary).

```robot
${data}=    Evaluate    ${response.json()}    json
```


---


## ✅ Response Validation Methods in Robot Framework

Different approaches to validate response body content in Robot Framework, ordered by readability and beginner-friendliness:

| Method                  | Description                                  | Example |
|-------------------------|----------------------------------------------|---------|
| **Should Contain**      | Simple string-based check for keywords or values | `Should Contain    ${response.text}    "booked"` |
| **Convert To Dictionary** | Built-in keyword, clean and beginner-friendly | `${data}=    Convert To Dictionary    ${response.json()}`  <br>`Should Be Equal    ${data["status"]}    "booked"` |
| **Get From Dictionary** | Clean way to access nested keys with better readability | `${data}=    Convert To Dictionary    ${response.json()}`  <br>`${status}=    Get From Dictionary    ${data}    status`  <br>`Should Be Equal    ${status}    booked` |
| **Evaluate**            | Pythonic and flexible, better for complex logic | `${data}=    Evaluate    ${response.json()}    json`  <br>`Should Be Equal    ${data["status"]}    "booked"` |


---

## ✅ Example:

Suppose the response body you get from an API is this **JSON string**:

```json
{
  "id": 123,
  "name": "Maria",
  "status": "booked"
}
```

Without parsing, this is just a **plain text string**:

```text
"{ \"id\": 123, \"name\": \"Maria\", \"status\": \"booked\" }"
```

---

When you call `${response.json()}`, it returns a **Python dictionary** (under the hood).

But when you call `${response.json()}` inside `Evaluate` in Robot Framework:

```robot
${json}=    Evaluate    ${response.json()}    json
```

It becomes a **Robot Framework dictionary**, which you can interact with using RF syntax:

```robot
Should Be Equal    ${json["status"]}    booked
```

---
