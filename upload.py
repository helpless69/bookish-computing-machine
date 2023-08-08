import pathlib
import requests
import sys
from IPython.display import HTML


def upload(path, api_url):
    upload = requests.post(api_url, files={'file': open(path,'rb')},)
    # print("Download link: " + upload.json()["data"]["file"]["url"]["full"])
    display(HTML(f'<p style="font-family: Trebuchet MS; font-size: 18px;">Download link: {upload.json()["data"]["file"]["url"]["full"]}</p><br>'))


def main():
    # ==============================[ FORM ]==============================
    #@markdown <font size=5>← [Start] Uploader</font>
    source = "output.mp4" #@param {type: "string"}
    host = "anonfiles" #@param ["anonfiles", "filechan", "bayfiles", "hotfile", "letsupload", "lolabits", "megaupload", "myfile", "rapidshare", "share-online", "upvid", "vshare"]
    # ====================================================================
    
    domains = [
        'anonfiles.com',
        'filechan.org',
        'bayfiles.com',
        'hotfile.io',
        'letsupload.cc',
        'lolabits.se'
        'megaupload.nz',
        'myfile.is',
        'rapidshare.nu',
        'share-online.is',
        'upvid.cc',
        'vshare.is'
    ]
    
    if host == 'anonfiles':
        api_url = f'https://api.{domains[0]}/upload'

    if host == 'filechan':
        api_url = f'https://api.{domains[1]}/upload'
    
    if host == 'bayfiles':
        api_url = f'https://api.{domains[2]}/upload'
    
    if host == 'hotfile':
        api_url = f'https://api.{domains[3]}/upload'
    
    if host == 'letsupload':
        api_url = f'https://api.{domains[4]}/upload'
    
    if host == 'lolabits':
        api_url = f'https://api.{domains[5]}/upload'
    
    if host == 'megaupload':
        api_url = f'https://api.{domains[6]}/upload'
    
    if host == 'myfile':
        api_url = f'https://api.{domains[7]}/upload'
    
    if host == 'rapidshare':
        api_url = f'https://api.{domains[8]}/upload'
    
    if host == 'share-online':
        api_url = f'https://api.{domains[9]}/upload'
    
    if host == 'upvid':
        api_url = f'https://api.{domains[10]}/upload'
    
    if host == 'vshare':
        api_url = f'https://api.{domains[11]}/upload'

    if source == '':
        # print(f'[ABORTED]: There is no source given.')
        display(HTML(f'<p style="font-family: Trebuchet MS; font-size: 18px; color: #F44336;">[ABORTED]: ❌ There is no file to upload!</p>'))
        raise SystemExit
    else:
        try:
            if pathlib.Path(source).exists():
                if pathlib.Path(source).is_file():
                    upload(source, api_url)
                else:
                    for item in pathlib.Path(source).iterdir():
                        if item.is_file():
                            display(HTML(f'<p style="font-family: Trebuchet MS; font-size: 18px;">Uploading: "{item}"...'))
                            upload(item, api_url)
                        else:
                            # print('[ABORTED]: There is no file to upload.')
                            display(HTML(f'<p style="font-family: Trebuchet MS; font-size: 18px; color: #F44336;">[ABORTED]: ❌ There is no file to upload!</p>'))
                            raise SystemExit
            else:
                raise FileNotFoundError
        except Exception as execution_error:
            # print(f'[ERROR]: {execution_error}')
            display(HTML(f'<p style="font-family: Trebuchet MS; font-size: 18px; color: #F44336;">[ERROR]: ❌ {execution_error}</p>'))


if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        clear_output()
    except SystemExit:
        pass
                                 
