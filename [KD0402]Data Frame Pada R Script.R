#------------------------------R DataFrame-----------------------------#
#==================== Joko Eliyanto, S.Si., M.Pd. =====================#
#------------Pusat Studi Data Sains(PSDS) Matematika UAD---------------#


##-1-## Membuat DataFrame pada R

# Membuat Vektor
Nama_Buah <- c("Semangka", "Jeruk", "Apel", "Manggis", "Alpukat")
# Membuat DataFrame
df <- data.frame(Nama_Buah)
# Memanggil Data Frame
df 


# Membuat Vektor
Nama_Buah <- c("Semangka", "Jeruk", "Apel", "Manggis", "Alpukat")
# Membuat DataFrame
df <- data.frame(Nama_Buah)
# Mengubah Nama Kolom pada Data Frame
names(df) <- c('Nama Buah')
# Memanggil Data Frame
df 


# Membuat Vektor
Nama_Buah <- c("Semangka", "Jeruk", "Apel", "Manggis", "Alpukat")
Harga_Per_Kg <- c(5000, 7000, 6000, 8000, 10000)
# Membuat DataFrame
df <- data.frame(Nama_Buah, Harga_Per_Kg)
# Mengubah Nama Kolom DataFrame
names(df) <- c('Nama Buah', "Harga Per Kg")
# Memanggil Data Frame
df 


##-2-##  Mengimpor Data Frame Pada R

# Mengimpor Data Frame pada Data Frame
df = read.csv("https://raw.githubusercontent.com/jokoeliyanto/Kelas-Dasar-Pejuang-Data-2.0/main/Super-Store-Dataset.csv")
# Memanggil Data Frame
df

#install.packages("readxl")
library(readxl)
# Mengimpor data dari file xls/xlsx
df <- read_excel("SuperStoreDataset.xlsx")
# Memanggil Data Frame
df


##-3-##  Eksplorasi Data Frame

# Head
# Melihat data teratas pada dataframe
head(df)

# Tail
# Melihat data terbawah pada dataframe
tail(df)

# Dimension
# Melihat ukuran data frame(Baris X Kolom)
dim(df)


# Names
# Melihat nama-nama Kolom
names(df)
```

# Tipe Data Masing-masing Kolom
# Melihat Tipe Data Masing-masing Kolom
str(df)
```

# Summary
# Melihat statistik masing-masing kolom bertipe numerik
summary(df)

##-4-## Akses Data Frame(Slicing)

# Mengakses Data Frame Berdasarkan Baris
# Mengakses data Frame dari baris pertama sampai baris ke 10 untuk semua kolom
df[1:10,]

# Mengakses Data Frame Berdasarkan Nama Kolom
# Mengakses 1 kolom pada Data Frame, hasilnya data frame
df['profit']

# [Alternatif lain] Mengakses 1 kolom pada Data Frame, hasilnya Vector
df$profit

# Mengakses Data Frame lebih dari 1 kolom
df[c('profit', 'customer_id')] 

# Menerapkan fungsi head pada slicing data frame
head(df[c('profit', 'customer_id')])

# Mengakses data frame pada baris dan kolom tertentu
df[1,3]

# Mengakses data frame pada baris dan kolom tertentu [Bentuk Interval]
df[1:10,2:5]

# Mengakses data pada kolom tertentu dengan kriteria tertentu
print(df[df$profit==68714,])

print(df[df$profit==max(df$profit),])

# Memperoleh indeks hasil pencarian data dengan kriteria tertentu
which(df$profit==68714)

# Memperoleh indeks hasil pencarian data dengan kriteria tertentu (Menggunakan And)
print(subset(df, profit==68714 & segment=="Consumer"))

# Memperoleh indeks hasil pencarian data dengan kriteria tertentu (Menggunakan Or)
print(subset(df, profit==68714 | segment=="Consumer"))

##-5-## Memodifikasi Data Frame 1(Sort & Cleaning)

# Mengurutkan Data Berdasarkan Kolom Tertentu

# Mengurutkan data frame berdasarkan 1 kolom
# Menaik pada kolom profit, 
order_data <- df[order(df$profit),] 
print(order_data)

# Menurun pada kolom quantity, 
order_data <- df[order(-df$quantity),] 
print(order_data)

# Melihat Missing Data(NA)

sapply(df, function(x) sum(is.na(x)))


##-6-## Menerapkan fungsi-fungsi pada Data Frame

# table
# Menghitung jumlah data per kelas dalam data kategori
table(df$segment)

# max
# Nilai maximum data dalam satu kolom numerik
max(df$profit)

# min
# Nilai minimum data dalam satu kolom numerik
min(df$profit)

# mean
# Nilai rata-rata data dalam satu kolom numerik
mean(df$profit)

# sum
# Menjumlahkan data dalam satu kolom numerik
sum(df$profit)

##-7-## Eksploratory Data Anlysis[EDA] Dasar

### Mengakses dataset

df <- read.csv("https://raw.githubusercontent.com/jokoeliyanto/Kelas-Dasar-Pejuang-Data-2.0/main/Super-Store-Dataset.csv")
head(df)

### Melihat Missing Data(NA)

sapply(df, function(x) sum(is.na(x)))


### Melihat Statistik Data

summary(df)

## Eksploratory Data Analysis[EDA] Lanjut

#  Segment Produk Apakah Yang memiliki Keuntungan Tertinggi?
table(df$segment)

#Memilih masing-masing segmen
df_Consumer=df[df['segment']=='Consumer',]
df_Corporate=df[df['segment']=='Corporate',]
df_Home_Office=df[df['segment']=='Home Office',]

print(sum(df_Consumer$profit))

print(sum(df_Corporate$profit))

print(sum(df_Home_Office$profit))

#Jadi, segmen dengan keuntungan total tertinggi adalah **Consumer**
