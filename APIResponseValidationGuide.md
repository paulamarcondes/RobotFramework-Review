# 🧪 Robot Framework – API Response Validation Guide

This guide shows different ways to validate API response content in Robot Framework using `RequestsLibrary`, with explanations, examples, and best practices.

---

## ✅ Bonus – Common `${response}` Attributes in Robot Framework (RequestsLibrary)

This table outlines the most frequently used attributes when working with response objects from HTTP requests in Robot Framework using the RequestsLibrary.

| Attribute                 | Description                                                   | Example Use |
|--------------------------|---------------------------------------------------------------|--------------|
| `${response.status_code}` | The HTTP status code returned by the server                   | `Should Be Equal As Integers    ${response.status_code}    200` |
| `${response.text}`        | Response body as a string (usually JSON or plain text)        | `Should Contain    ${response.text}    "inmateId"` |
| `${response.json()}`      | Parses the response body and returns a JSON dictionary (requires `Evaluate`) | `${json}=    Evaluate    ${response.json()}    json` |
| `${response.headers}`     | Dictionary of response headers                                | `Should Contain    ${response.headers['Content-Type']}    application/json` |
| `${response.content}`     | Raw response content in bytes                                 | Useful for binary data or file downloads |

---

### ✅ Most Used in Practice

For day-to-day API testing, these are the top 3 you'll use:

- `status_code` → for validating response success or error
- `json()` → for checking specific fields (requires `Evaluate`)
- `headers` → for content type, authentication, etc.

---

💡 **Tip**: Parsing means transforming a JSON string into a structured dictionary so you can easily validate fields.

```robot
${data}=    Evaluate    ${response.json()}    json
```

---

## ✅ Response Validation Methods in Robot Framework

Different approaches to validate response body content in Robot Framework, ordered by readability and beginner-friendliness:

| Method                  | Description                                  | Example |
|-------------------------|----------------------------------------------|---------|
| **Should Contain**      | Simple string-based check for keywords or values | `Should Contain    ${response.text}    "booked"` |
| **Convert To Dictionary** | Built-in keyword, clean and beginner-friendly | `${data}=    Convert To Dictionary    ${response.json()}`<br>`Should Be Equal    ${data["status"]}    "booked"` |
| **Get From Dictionary** | Clean way to access nested keys with better readability | `${data}=    Convert To Dictionary    ${response.json()}`<br>${status}=    Get From Dictionary    ${data}    status<br>`Should Be Equal    ${status}    booked` |
| **Evaluate**            | Pythonic and flexible, better for complex logic | `${data}=    Evaluate    ${response.json()}    json`<br>`Should Be Equal    ${data["status"]}    "booked"` |

---

### ✅ Example

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

🧠 **Pro Tip**: Prefer `Convert To Dictionary` + `Get From Dictionary` for clean and readable test cases. Use `Evaluate` only when needed for advanced logic.

---
