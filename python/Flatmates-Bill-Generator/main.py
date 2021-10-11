from flat import Bill, Flatmate
from reports import PdfReport

amount = float(input("Enter bill amount: "))
user_period = input("Enter period (eg: March 2021): ")
f1 = input("Enter first flatmate's name: ")
days1 = int(input(f"Enter number of days {f1} stayed in house: "))
f2 = input("Enter second flatmate's name: ")
days2 = int(input(f"Enter number of days {f2} stayed in house: "))

the_bill = Bill(amount=amount, period=user_period)
flatmate1 = Flatmate(name=f1, days_in_house=days1)
flatmate2 = Flatmate(name=f2, days_in_house=days2)

print(f"{f1} has to pay:", flatmate1.pay(bill=the_bill, flatmate2=flatmate2))
print(f"{f2} has to pay:", flatmate2.pay(bill=the_bill, flatmate2=flatmate1))

pdf_report = PdfReport(filename=f'{the_bill.period}.pdf')
pdf_report.generate(flatmate1=flatmate1, flatmate2=flatmate2, bill=the_bill)
