import webbrowser

from fpdf import FPDF

import os


class PdfReport:
    """
    Create a pdf report that contains data about
    the flatmates such as their names, their due
    amount and the period of the bill.
    """

    def __init__(self, filename):
        self.filename = filename

    def generate(self, flatmate1, flatmate2, bill):
        flatmate1_pay = str(round(flatmate1.pay(bill, flatmate2), 2))
        flatmate2_pay = str(round(flatmate2.pay(bill, flatmate1), 2))

        pdf = FPDF(orientation='P', unit='pt', format='A4')
        pdf.add_page()

        # Add icon
        pdf.image("files/house.png", w=30, h=30)

        # Insert title
        # If you put border=0 then outline of rectangle disappears
        # ln=1 will shift the cell to next line
        pdf.set_font(family='Times', style='B', size=24)
        pdf.cell(w=0, h=80, txt='Flatmates Bill', border=0,
                 align='C', ln=1)

        # Insert period label and value
        pdf.set_font(family='Times', style='B', size=14)
        pdf.cell(w=100, h=40, txt='Period:', border=0)
        pdf.cell(w=150, h=40, txt=bill.period, border=0, ln=1)

        # Insert name and due amount of the first flatmate
        pdf.set_font(family='Times', size=12)
        pdf.cell(w=100, h=25, txt=flatmate1.name, border=0)
        pdf.cell(w=150, h=25,
                 txt=flatmate1_pay,
                 border=0, ln=1)

        # Insert name and due amount of the second flatmate
        pdf.cell(w=100, h=25, txt=flatmate2.name, border=0)
        pdf.cell(w=150, h=25,
                 txt=flatmate2_pay,
                 border=0, ln=1)

        # Change directory to files, generate and open the PDF
        os.chdir("files")
        pdf.output(self.filename)
        webbrowser.open(self.filename)
