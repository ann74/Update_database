import json

if __name__ == '__main__':
    with open('suppliers.json', encoding='utf-8') as f:
        data = json.load(f)

    with open('suppliers.sql', 'w', encoding='utf-8') as file_suppliers,\
            open('update_products.sql', 'w', encoding='utf-8') as file_update:
        for i in range(len(data)):
            products = "'" + "', '".join([y.replace("'", "''") for y in data[i].pop('products')]) + "'"
            item = [y.replace("'", "''") for y in sum([x.split(';') for x in data[i].values()], [])]
            values = f"""{i + 1}, '{"', '".join(item)}'"""
            insert_req = f"INSERT INTO suppliers VALUES ({values});"
            update_req = f"UPDATE products SET supplier_id = {i + 1} WHERE product_name in ({products});"
            print(insert_req, file=file_suppliers)
            print(update_req, file=file_update)

