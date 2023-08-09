# Kuan V, Denaxas S, Gonzalez-Izquierdo A, Direk K, Bhatti O, Husain S, Sutaria S, Hingorani M, Nitsch D, Parisinos C, Lumbers T, Mathur R, Sofat R, Casas JP, Wong I, Hemingway H, Hingorani A, 2023.

import sys, csv, re

codes = [{"code":"H57y400","system":"readv2"},{"code":"K01x400","system":"readv2"},{"code":"K01x411","system":"readv2"},{"code":"K0B4000","system":"readv2"},{"code":"M154000","system":"readv2"},{"code":"M154200","system":"readv2"},{"code":"M154300","system":"readv2"},{"code":"M154400","system":"readv2"},{"code":"M154500","system":"readv2"},{"code":"M154600","system":"readv2"},{"code":"M154700","system":"readv2"},{"code":"M154z00","system":"readv2"},{"code":"N000200","system":"readv2"},{"code":"N000300","system":"readv2"},{"code":"N000400","system":"readv2"},{"code":"N000600","system":"readv2"},{"code":"N000z00","system":"readv2"},{"code":"100692.0","system":"med"},{"code":"101433.0","system":"med"},{"code":"106086.0","system":"med"},{"code":"108072.0","system":"med"},{"code":"11920.0","system":"med"},{"code":"20007.0","system":"med"},{"code":"22205.0","system":"med"},{"code":"25390.0","system":"med"},{"code":"2667.0","system":"med"},{"code":"29519.0","system":"med"},{"code":"31564.0","system":"med"},{"code":"33449.0","system":"med"},{"code":"36942.0","system":"med"},{"code":"40797.0","system":"med"},{"code":"41148.0","system":"med"},{"code":"4125.0","system":"med"},{"code":"42719.0","system":"med"},{"code":"44095.0","system":"med"},{"code":"44984.0","system":"med"},{"code":"45726.0","system":"med"},{"code":"46148.0","system":"med"},{"code":"47672.0","system":"med"},{"code":"51798.0","system":"med"},{"code":"57675.0","system":"med"},{"code":"58706.0","system":"med"},{"code":"63283.0","system":"med"},{"code":"63955.0","system":"med"},{"code":"65391.0","system":"med"},{"code":"7522.0","system":"med"},{"code":"7871.0","system":"med"},{"code":"94751.0","system":"med"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('lupus-erythematosus-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["lupus-erythematosus-local-and-systemic---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["lupus-erythematosus-local-and-systemic---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["lupus-erythematosus-local-and-systemic---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
