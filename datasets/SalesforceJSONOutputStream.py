import json

from snowfakery.output_streams import JSONOutputStream


class SalesforceJSONOutputStream(JSONOutputStream):
    def write_single_row(self, tablename: str, row: dict) -> None:
        if self.first_row:
            self.write("[")
            self.first_row = False
        else:
            self.write(",\n")
        values = {"attributes": {"type": tablename}, **row}
        self.write(json.dumps(values))
