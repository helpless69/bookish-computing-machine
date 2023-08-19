import requests
import anyio
import os
from pathlib import Path
from signalstickers_client import StickersClient
from signalstickers_client.models import LocalStickerPack, Sticker


async def upload_pack(stickerly_pack_id, pack_name, pack_author):
    def add_sticker(path, emoji):
        stick = Sticker()
        stick.id = pack.nb_stickers
        stick.emoji = emoji

        with open(path, "rb") as f_in:
            stick.image_data = f_in.read()

        pack._addsticker(stick)

    pack = LocalStickerPack()

    pack.title = pack_name
    pack.author = pack_author

    # Add the stickers here, with their emoji
    # Accepted format:
    # - Non-animated webp
    # - PNG
    # - GIF <100kb for animated stickers
    images = os.listdir(f"res/{stickerly_pack_id}")
    for image_name in images:
        add_sticker(f"res/{stickerly_pack_id}/{image_name}", "🤪")

    # Specifying a cover is optional
    # By default, the first sticker is the cover
    cover = Sticker()
    cover.id = pack.nb_stickers
    # Set the cover file here
    with open(f"res/{stickerly_pack_id}/{images[0]}", "rb") as f_in:
        cover.image_data = f_in.read()
    pack.cover = cover
    print("downloaded all stickers!")
