import sys

class TRow():
    
    def __init__(self, line, indent = 0, xmlid = "td"):
        self.line = line
        self.indent = indent
        self.xmlid = xmlid
        
    def __str__(self):
        
        rowBegin = self.indent * ' ' + "<" + self.xmlid + ">"
        rowEnd = self.indent * ' ' + "</" + self.xmlid + ">"
        
        lineList = [rowBegin]
        
        joiner = '</p>\n' + self.indent * ' ' + '</' + self.xmlid + '>\n' + self.indent * ' ' + '<' + self.xmlid + '>\n' + (self.indent + 2) * ' ' + '<p>'
        rowMiddle = (self.indent + 2) * ' ' + '<p>' + joiner.join([i for i in self.line.split()]) + '</p>'
        
        lineList.append(rowMiddle)
        lineList.append(rowEnd)

        return '\n'.join(lineList)

class Table():
    
    def __init__(self, data, header = None, indentStart = 0):
        
        self.data = []
        self.indentStart = indentStart
        if header is not None:
            Row = TRow(header, indent = self.indentStart + 6, xmlid = "th")
            self.data.append(Row)
            
        for line in data:
            Row = TRow(line.rstrip(), indent = self.indentStart + 6)
            self.data.append(Row)
            
    def __str__(self):
        
        rows = self.indentStart * ' ' + '<table>\n' + (self.indentStart + 2) * ' ' + '<tbody>\n'
        for i in self.data:
            rows += (self.indentStart + 4) * ' ' + "<tr>\n" + str(i) + "\n" + (self.indentStart + 4) * ' ' + "</tr>\n"
        rows += (self.indentStart + 2) * ' ' + '</tbody>\n' + self.indentStart * ' ' + '</table>'
        return rows.rstrip()

if __name__ == "__main__":
    myTable = Table(sys.stdin, header = sys.argv[1], indentStart = 8)
    print myTable
