
#sql


import_psql() {
    echo "import $2 in db $1"
    psql $1 root -h localhost -f $2
}