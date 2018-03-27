

HOME=/scratch/$USER/neural-editor-slurm/
DATA_DIR=$HOME/neural-editor/data

export TEXTMORPH_DATA=$DATA_DIR

# Set up data directory
rm -Rf $DATA_DIR

mkdir -p $DATA_DIR
cd $DATA_DIR


# download GloVe vectors
wget http://nlp.stanford.edu/data/glove.6B.zip  # GloVe vectors
unzip glove.6B.zip -d word_vectors

cd word_vectors

# download GloVe extended vectors
wget https://worksheets.codalab.org/rest/bundles/0x89bc0497bbb14ee489d33e032fa43a2e/contents/blob/glove.6B.300d_onebil.txt
wget https://worksheets.codalab.org/rest/bundles/0x89bc0497bbb14ee489d33e032fa43a2e/contents/blob/glove.6B.300d_yelp.txt



# download billionword
mkdir $DATA_DIR/onebillion_split
cd $DATA_DIR/onebillion_split

wget https://worksheets.codalab.org/rest/bundles/0x017b7af92956458abc7f4169830a6537/contents/blob/free.txt
wget https://worksheets.codalab.org/rest/bundles/0x017b7af92956458abc7f4169830a6537/contents/blob/train.tsv
wget https://worksheets.codalab.org/rest/bundles/0x017b7af92956458abc7f4169830a6537/contents/blob/valid.tsv
wget https://worksheets.codalab.org/rest/bundles/0x017b7af92956458abc7f4169830a6537/contents/blob/test.tsv


# dowload yelp
mkdir $DATA_DIR/yelp_dataset_large_split
cd $DATA_DIR/yelp_dataset_large_split

wget https://worksheets.codalab.org/rest/bundles/0x99d0557925b34dae851372841f206b8a/contents/blob/free.txt
wget https://worksheets.codalab.org/rest/bundles/0x99d0557925b34dae851372841f206b8a/contents/blob/test.tsv
wget https://worksheets.codalab.org/rest/bundles/0x99d0557925b34dae851372841f206b8a/contents/blob/train.tsv
wget https://worksheets.codalab.org/rest/bundles/0x99d0557925b34dae851372841f206b8a/contents/blob/valid.tsv



