
# coding: utf-8

# In[36]:


usecase = {'atm_p1 wd_p2':'ATM WITHDRAWAL',
            'atm_p1 trf_p2':'ATM TRANSFER',
            'atm_p1 pur_p2':'ATM PURCHASE',
            'atm_p1':'ATM',
            'NUM_P1 int_P2':'Undefined',
            'NUM_P1 int_p2 pd_p3':'Undefined',
            'NUM_P1 wtax_p2':'TAX',
            'NUM_P1 wtax_p2 pd_p3':'TAX',
            'NUM_P1 book_p2':'Booking',
            'NUM_P1 NUM_P2':'Undefined',
            'NUM_P1':'Undefined',
            'vtairtelNUM_P1':'AIRTEL',
            'accttrsfNUM_P1':'TRANSFER',
            'tdNUM_P1':'Undefined',
            'tdNUM_P1':'Undefined',
            '08fmrqNUM_P1':'Undefined',
            'vtmtnNUM_P1':'Undefined',
            'vtgloNUM_P1':'Undefined',
            'sms_P1':'SMS',
            'cash_P1 receipt_P2':'CASH RECEIPT',
            'cash_P1 payment_P2':'CASH PAYMENT',
            'cash_P1':'CASH',
            'iso_P1':'Undefined',
            'rou_P1':'Undefined',
            'cdb_P1':'CASH DEBIT',
            'cdb_P1 self_P2':'CASH DEBIT',
            'cdb_P1 mrs_P2':'CASH DEBIT',
            'tnf_P1':'TRANSFER',
            'cdb_P1web_P1':'WEB',
            'cdb_P1web_P1 self_P2':'WEB',
            'cdb_P1web_P1 mrs_P2':'WEB',
            'web_P1':'WEB',
            'web_P1 ubr_P3':'WEB',
            'web_P1 3qtl002_P3':'WEB',
            'web_P1 3bolNUM_P3':'WEB',
            'web_P1 dr_P2':'WEB',
            'web_P1 3iap0isw_P3':'WEB',
            'web_P1 uda_P3':'WEB',
            'web_P1 4qtlNUM_P3':'WEB',
            'web_P1 3iapNUM_P3':'WEB',
            'mobpymt_P1':'MOBILE PAYMENT',
            'pos_P1':'POS',
            'pos_P1 dr_P2':'POS WITHDRAW',
            'pos_P1 acq_P2':'POS ACQUISITION',
            'pos_P1 acq_P2 fee_P3':'POS ACQUISITION',
            'pos_P1 fee_P3':'POS FEE',
            'pos_P1 NUMpa01_P3':'POS',
            'card_P1':'CARD',
            'card_P1 april_P3':'CARD',
            'trf_P1 to_P2':'TRANSFER TO',
            'trf_P1 ifo_P2':'TRANSFER INFO',
            'trf_P1 frm_P2':'TRANSFER FROM',
            'trf_P1 from_P2':'TRANSFER FROM',
            'trf_P1':'TRANSFER',
            'tud_P1 from_P2':'TUD',
            'tud_P1':'TUD',
            'cif_P1':'CUSTOMER INFO',
            'cif_P1 cif_P2':'CUSTOMER INFO',
            'fnn_P1':'FINE',
            'fnn_P1 NUMcNUM_P2':'FINE',
            'fnn_P1 NUMcNUM_P2 late_P3':'LATE FINE',
            'fnn_P1 late_P3':'LATE FINE',
            'fnn_P1 normal_P3':'FINE',
            'fnn_P1 NUMcNUM_P2 normal_P3':'FINE',
            'nan_P1':'Undefined',
            'chq_P1':'CHEQUE',
            'chq_P1 no_P2':'CHEQUE NO',
            'chq_P1 ifo_P3':'CHEQUE INFO',
            'cd_P1':'CASH DEPOSIT',
            'cd_P1 by_P3':'CASH DEPOSIT',
            'r_P1':'Undefined',
            'r_P1  tr_P3':'Undefined',
            'upay_P1':'UPI',
            'upay_P1 vat_P2':'UPI VAT',
            'upay_P1 u_P2':'UPI',
            'upay_P1 april_P2':'UPI',
            'upay_P1 on_P3':'UPI',
            'upay_P1 vat_P2 on_P3':'UPI VAT',
            'upay_P1 u_P2 connect_P3':'UPI CONNECT',
            'upay_P1 connect_P3':'UPI CONNECT',
            'upay_P1 u_P2':'UPI',
            'cwb_P1':'Undefined',
            'nft_P1':'NEFT',
            'nft_P1 unified_P2':'NEFT',
            'nft_P1 unified_P2 payments_P3':'NEFT',
            'nft_P1 payments_P3':'NEFT',
            'nft_P1 state_P3':'NEFT',
            'stamp_P1':'STAMP',
            'stamp_P1 duty_P2':'STAMP DUTY',
            'cdp_P1':'CASH DEPOSIT',
            'cdp_P1 by_P3':'CASH DEPOSIT',
            'book_P1':'BOOKING',
            'ppp_P1':'PPP',
            'ppp_P1 kcgaming_P3':'PPP',
            'ppp_P1 payarena_P3':'PPP',
            'revaluation_P1':'REVALUATION',
            'revaluation_P1 ngn_P3':'REVALUATION',
            'vat_P1':'VAT',
            'vat_P1 acct_P3':'VAT ACCOUNT',
            'cwd_P1':'Undefined',
            'bwy_P1':'Undefined',
            'consolidated_P1 withholding_P2 tax_P3':'CONSOLIDATED WITHHOLDING TAX',
            'consolidated_P1':'CONSOLIDATED',
            'consolidated_P1 withholding_P2':'CONSOLIDATED WITHHOLDING',
            'consolidated_P1 booking_P2':'CONSOLIDATED BOOKING',
            'consolidated_P1 payment_P3':'CONSOLIDATED PAYMENT',
            'consolidated_P1 tax_P3':'CONSOLIDATED TAX',
            'sweep_P1':'SWEEP',
            'sweep_P1 head_P3':'SWEEP',
            'acct_P1':'ACCOUNT',
            'acct_P1 main_P2':'ACCOUNT',
            'ibkg_P1':'INTERNET BANKING',
            'ibkg_P1 109_P2':'INTERNET BANKING',
            'ibkg_P1 109_P2 isw_P3':'INTERNET BANKING',
            'ibkg_P1 isw_P3':'INTERNET BANKING',
            'cla_P1':'Undefined',
            'csh_P1':'CASH',
            'csh_P1 0_P3':'CASH',
            'charges_P1':'CHARGES',
            'charges_P1 estatement_P3':'CHARGES ESTATEMENT',
            'vlt_P1':'Undefined',
            'nip_P1':'Undefined',
            'cw_P1':'Undefined',
            'cwl_P1':'Undefined',
            'postage_P1 stamp_P2':'POSTAGE STAMP',
            'postage_P1':'POSTAGE',
            'commission_P1':'COMMISSION',
            'n_P1':'Undefined',
            'accttrsf_P1':'TRANSFER',
            'trsf_P1':'TRANSFER',
            'mobtrf_P1':'MOBILE TRANSFER',
            'umobnig_P1':'Undefined',
            'umobnig_P1 uto_P2':'Undefined',
            'transfer_P1':'TRANSFER',
            'uba_P1':'Undefined',
            'uba_P1 oprNUM_P2':'Undefined',
            'frm_P1':'FROM',
            'tdNUM_P1':'Undefined',
            '08fmrqNUM_P1':'Undefined',
            '08fmrqNUM_P1 qtr_P3':'Undefined',
            'v_P1':'Undefined',
            'april_P1':'Undefined',
            'tfr_P1':'TRANSFER',
            'self_P1':'SELF',
            'tax_P1':'TAX',
            'mg_P1':'Undefined',
            '0_P1':'Undefined',
            'from_P1':'FROM',
            'mc_P1':'Undefined',
            'cost_P1':'COST',
            'to_P1':'TO',
            'vt_P1':'Undefined',
            't1_P1':'Undefined',
            't2_P1':'Undefined',
            'admin_P1':'ADMIN'}

infilename ='/home/aman/Documents/Transaction_Classification_Problem/output_data_dump.csv'
outfilename ='/home/aman/Downloads/TxnClass/dict_output.csv'


# In[25]:


import csv

colP1 = []
colP2 = []
colP3 = []
with open(infilename, 'r') as file:
    reader = csv.reader(file, delimiter=',')
    for row in reader:
        colP1.append(row[1])
        colP2.append(row[2])
        colP3.append(row[3])

'''
# In[29]:


print(colP1[427])
# postage_P1 stamp_P2 on_P3


# In[30]:


print(colP2[427])
# postage_P1 stamp_P2 on_P3


# In[31]:


print(colP3[427])
# postage_P1 stamp_P2 on_P3


# In[49]:


print(colP1[444]+' '+colP2[444]+' '+colP3[444])
print(colP1[427]+' '+colP2[427]+' '+colP3[427])


# In[41]:


print(usecase.get('postage_P1 stamp_P2')) #match
print(usecase.get(colP1[427]+' '+colP2[427]+' '))
print(usecase.get(colP1[427]+' '+colP2[427]+' '+colP3[427]))
print(usecase.get(colP1[427]+' '+colP2[427])) #match


# In[45]:


x3 = colP1[427]+' '+colP2[427]+' '+colP3[427]
x2 = colP1[427]+' '+colP2[427]
x1 = colP1[427]

if x3 in usecase:
    print(usecase[x3])
    print('under first check')
elif x2 in usecase:
    print(usecase[x2])
    print('under second check')
elif x1 in usecase:
    print(usecase[x1])
    print('under third check')
else:
    print('Undefined')
    print('under last check')
   
    


# In[47]:


x3 = colP1[444]+' '+colP2[444]+' '+colP3[444]
x2 = colP1[444]+' '+colP2[444]
x1 = colP1[444]

if x3 in usecase:
    print(usecase[x3])
    print('under first check')
elif x2 in usecase:
    print(usecase[x2])
    print('under second check')
elif x1 in usecase:
    print(usecase[x1])
    print('under third check')
else:
    print('Undefined')
    print('under last check')
   
   


# In[59]:
'''


#generalize
with open(infilename, 'r') as infile, open(outfilename,'w') as outfile:
    for i,line in enumerate(infile):
        key3 = colP1[i]+' '+colP2[i]+' '+colP3[i]
        key2 = colP1[i]+' '+colP2[i]
        key1 = colP1[i]
        
        if key3 in usecase:
            #print(usease[key3])
            outfile.write(usecase[key3]+'\t'+line) #''udjfjf \n'+ 'fuf \n'
        elif key2 in usecase:
            #print(usecase[key2])
            outfile.write(usecase[key2]+'\t'+line)
        elif key1 in usecase:
            #print(usecase[key1])
            outfile.write(usecase[key1]+'\t'+line)
        else:
            #print('Undefined')
            outfile.write('Undefined'+'\t'+line)
           
       

