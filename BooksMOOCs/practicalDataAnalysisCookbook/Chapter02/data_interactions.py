import pandas as pd
import sqlalchemy as sa

# names of the files to output the samples
w_filenameD3js = '../../Data/Chapter02/realEstate_d3.csv'

# database credentials
usr  = 'py_usr'
pswd = 'py_pwd'
db='py_db'

# create the connection to the database
engine = sa.create_engine(
    'postgresql+psycopg2://{0}:{1}@localhost:5432/{2}' \
    .format(usr, pswd,db)
)

# read prices from the database
query = '''SELECT *
        FROM towns 
        limit 100'''
data = pd.read_sql_query(query, engine)

# output the samples to files
with open(w_filenameD3js,'w') as write_csv:
    write_csv.write(data.to_csv(sep=',', index=False))


# CREATE TABLE Towns (
#   id SERIAL UNIQUE NOT NULL,
#   code VARCHAR(10) NOT NULL,
#   article TEXT,
#   name TEXT NOT NULL, 
#   department VARCHAR(4) NOT NULL,
#   UNIQUE (code,department)
# );
# insert into towns (
#     code, article, name, department
# )
# select
#     left(md5(i::text), 10),
#     md5(random()::text),
#     md5(random()::text),
#     left(md5(random()::text), 4)
# from generate_series(1, 10000) s(i)