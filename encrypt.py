import requests
import base64

def encrypt(path_backup, path_iv, genid, module_name):

    backup_string = ""
    iv_string = ""
    with open(path_backup, 'r') as myfile:
        backup_string = myfile.read()
    with open(path_iv, 'r') as myfile:
        iv_string = myfile.read()

    genid = "638318333934100731"
    module_name = "%24edgeAgent"
    ip = ":8080{decrypt_url}"
    decrypt_url = f"/modules/{module_name}/genid/{genid}/encrypt?api-version=2022-08-03"
    base_url = f"https://{ip}{decrypt_url}"
    ba_iv = base64.b64encode(iv_string) 

    request_body = {
        "plaintext": backup_string,
        "initializationVector": ba_iv
    }
    response = requests.post(base_url, json=request_body)
    base64_cipher = response.json()["ciphertext"]
    ciphertext = base64.b64decode(base64_cipher)

    with open("encrypted_backup.json", "wb") as myfile:
        myfile.write(ciphertext)

    return f"""decoded ciphertext outputted to encrypted_backup.json:
        {ciphertext}"""