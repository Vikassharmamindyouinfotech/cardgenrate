import os
import requests

def download_google_fonts(output_dir, font_list):
    # Create output directory if it doesn't exist
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    # Fetch the list of available fonts from Google Fonts API
    fonts_url = "https://www.googleapis.com/webfonts/v1/webfonts?key=AIzaSyBE6vP51pMzqxGJZOGUDabCpSrvqLbyaHI"
    response = requests.get(fonts_url)
    font_data = response.json()

    if 'items' not in font_data:
        print("Unable to fetch font list from Google Fonts API")
        return

    # Download fonts that are in the curated list
    for font in font_data['items']:
        font_family = font['family']
        if font_family in font_list:
            font_url = font['files']['regular']
            font_filename = os.path.join(output_dir, f"{font_family.replace(' ', '_')}_regular.ttf")
            download_font(font_url, font_filename)

def download_font(url, filename):
    # Download font file
    response = requests.get(url)
    if response.status_code == 200:
        with open(filename, 'wb') as f:
            f.write(response.content)
        print(f"Downloaded: {filename}")
    else:
        print(f"Failed to download {filename}")

if __name__ == "__main__":
    output_directory = "wedding_invitation_fonts"
    fonts = [
    "Adorn",
    "Alex Brush",
    "Allura",
    "Amatic SC",
    "Andada",
    "Arizonia",
    "Asap",
    "Baskerville",
    "Bebas Neue",
    "Bell MT",
    "Bodoni MT",
    "Brush Script MT",
    "Calibri",
    "Calluna",
    "Cambria",
    "Cinzel",
    "Cormorant",
    "Crimson Text",
    "Dancing Script",
    "Domine",
    "EB Garamond",
    "Edwardian Script ITC",
    "Exo",
    "Fanwood Text",
    "Fira Sans",
    "Gabriola",
    "Georgia",
    "Goudy Old Style",
    "Great Vibes",
    "Hind",
    "Inconsolata",
    "Josefin Sans",
    "Lato",
    "League Script",
    "Libre Baskerville",
    "Lobster",
    "Lora",
    "Merriweather",
    "Montserrat",
    "Nunito",
    "Old Standard TT",
    "Open Sans",
    "Oswald",
    "Pacifico",
    "Palatino",
    "Playfair Display",
    "Poppins",
    "PT Sans",
    "PT Serif",
    "Quattrocento",
    "Quicksand",
    "Raleway",
    "Roboto",
    "Sacramento",
    "Sansita",
    "Source Sans Pro",
    "Spectral",
    "Tangerine",
    "Times New Roman",
    "Titillium Web",
    "Ubuntu",
    "Verdana",
    "Vollkorn",
    "Work Sans",
    "Yanone Kaffeesatz",
    "Abril Fatface",
    "Acme",
    "Advent Pro",
    "Aleo",
    "Arvo",
    "Bree Serif",
    "Cabin",
    "Catamaran",
    "Courgette",
    "Crimson",
    "Dosis",
    "Enriqueta",
    "Fjalla One",
    "Francois One",
    "Gloria Hallelujah",
    "Gruppo",
    "Jura",
    "Karla",
    "Khand",
    "League Gothic",
    "Lemon",
    "Libre Franklin",
    "Limelight",
    "Lobster Two",
    "Muli",
    "Nanum Gothic",
    "Neuton",
    "Noticia Text",
    "Overpass",
    "Oxygen",
    "Patua One",
    "Philosopher",
    "Play",
    "Podkova",
    "Poiret One"
]

    download_google_fonts(output_directory, fonts)
