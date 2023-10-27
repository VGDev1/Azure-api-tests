from decrypt import decrypt
from encrypt import encrypt


def main():
    path_backup = "backup.txt"
    path_iv = "iv.txt"
    genid = "638318333934100731"
    module_name = "%24edgeAgent"

    dec = decrypt(path_backup, path_iv, genid, module_name)
    enc = encrypt(path_backup, path_iv, genid, module_name)

    print(dec)

    print(enc)




if __name__ == "__main__":
    main()