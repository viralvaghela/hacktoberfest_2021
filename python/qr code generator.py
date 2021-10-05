import qrcode
# Link for website
input_data = "https://github.com/viralvaghela/hacktoberfest_2021/new/main/python"
#Creating an instance of qrcode
qr = qrcode.QRCode(
        version=1,
        box_size=10,
        border=5)
qr.add_data(input_data)
qr.make(fit=True)
img = qr.make_image(fill='black', back_color='white')
img.save('qrcode001.png')
