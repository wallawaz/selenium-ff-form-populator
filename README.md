## Selenium Firefox Form-Populator ##

### Install ###

```
sudo bash install_virtualenv.sh
```
#### Create and Activate virtualenv ####
```
virtualenv venv
source venv/bin/activate
```
#### Install Selenium python packages (within virtualenv) ####
```
pip install -r requirements.txt
```
#### Download Firefox (Gecko) Driver ####
```
bash download_ff.sh
```

## Usage ###
```
python populate.py <weburl> <populate_value> (DEFAULT 600000)
```
- Opens a Firefox window and loads webpage <weburl>.
- Finds all text input forms on webpage and populates text values with <populate_value>.
- Submits web form.
