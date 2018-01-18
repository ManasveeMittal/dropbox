spray_template = '''
dfuplus server={{ params.server }} action=spray overwrite=1 srcip={{ params.srcip }} \
        username={{ params.username }} password={{ params.passwd }} srcfile={{ params.srcfile }} \
        dstname="{{ params.quarantine }}" dstcluster={{ params.dstcluster }} \
        format=csv separator="\{{ params.delimiter }}" recordstructurepresent=1 compress=1
'''

despray_template = '''
dfuplus server={{ params.server }} action=despray overwrite=1 srcip={{ params.srcip }} \
        username={{ params.username }} password={{ params.passwd }} srcname={{ params.srcfile }} \
        dstip={{ params.dstip }} dstfile="{{ params.dstfile }}"
'''

rename_template = '''
dfuplus server={{ params.server }} action=rename \
    srcname="{{ params.srcname }}" dstname="{{ params.dstname }}" \
    overwrite=1 srcip={{ params.srcip }} username={{ params.username }} \
    password={{ params.passwd }} dstcluster={{ params.dstcluster }}
'''

remove_template = '''
dfuplus server={{ params.server }} action=remove \
    name="{{ params.dstname }}"  srcip={{ params.srcip }} username={{ params.username }} \
    password={{ params.passwd }} dstcluster={{ params.dstcluster }}
'''

compile_template = '''
eclcc -syntax \
    {% for path in params.include_paths %} \
        -I {{ path }} \
    {% endfor %} \
    {{ params.ecl_file }}
'''

run_template = '''
ecl run --wait=0 --server={{ params.server }} --target={{ params.cluster }} \
    --username={{ params.username }} --password={{ params.passwd }} \
    {% for path in params.include_paths %} \
        -I {{ path }} \
    {% endfor %} \
    {{ params.ecl_file }}
'''

status_template = '''
ecl status --server={{ params.server }} --username={{ params.username }} --password={{ params.passwd }} \
    -wu {{ params.wuid }}
'''

recdef_template = ''' /opt/HPCCSystems/bin/daliadmin {{ params.server }} dfsfile {{ params.dataset }} '''

gitclone_template = ''' 
rm -rf {{ repo_dir }} ;
git clone {{ params.git_user }}@{{ params.git_host }}:{{ params.git_repo }} {{ params.repo_dir }} ;
'''

freqcode_template = '''
python {{ params.freq_gen_script }} -s {{ params.server }} -e {{ params.date }} \
	-a {{ params.action }} -f {{ params.file_scope }} -o {{ params.freq_out_dir }} \
	-i {{ params.out_list_file }}
'''
