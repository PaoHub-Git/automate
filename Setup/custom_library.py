from selenium import webdriver

def get_chrome_options(profile_path, profile_directory):
    chrome_options = webdriver.ChromeOptions()
    chrome_options.add_argument(f"--user-data-dir={profile_path}")
    chrome_options.add_argument(f"--profile-directory={profile_directory}")
    chrome_options.add_argument('--no-sandbox')
    chrome_options.add_argument('--disable-dev-shm-usage')
    return chrome_options



