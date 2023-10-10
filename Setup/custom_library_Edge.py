from selenium.webdriver import Edge, EdgeOptions

def get_edge_options(profile_path, profile_directory):
    edge_options = EdgeOptions()
    edge_options.use_chromium = True
    edge_options.add_argument(f"--user-data-dir={profile_path}")
    edge_options.add_argument(f"--profile-directory={profile_directory}")
    # Add any other required Edge options here
    return edge_options
