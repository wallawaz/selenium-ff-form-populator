[Selenium Firefox Form-Populator]

[Install]
1. ```sh
sudo bash install_virtualenv.sh
```
2. Create and Activate virtualenv
```sh
virtualenv venv
source venv/bin/activate
```
3. Install Selenium python packages (within virtualenv)
```sh
pip install -r requirements.txt
```
4. Download Firefox (Gecko) Driver
```sh
bash download_ff.sh
```

[Usage]
```
python populate.py <weburl> <populate_value> (DEFAULT 600000)
```
- Opens a Firefox window and loads webpage <weburl>.
- Finds all text input forms on webpage and populates text values with <populate_value>.
- Submits web form.
