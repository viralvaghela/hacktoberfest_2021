from PIL import Image, ImageDraw

txt = input("Enter your string: ")

img = Image.new("RGB", (200, 30), color=(0, 0, 0))

draw = ImageDraw.Draw(img)
draw.text((10, 10), txt, fill=(255, 255, 255))

img.save("lol.png")
