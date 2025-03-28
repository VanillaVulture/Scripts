Command prompt to make the "BigFile" in your drive
fsutil file createnew BigFile.txt #
--------------------------------------------------------------
## Storage Size Reference (Bytes)
Replace # with
Here is a list of common storage sizes in bytes, formatted for use in `cmd`:

- **1 KB**  = `1024` bytes  
- **1 MB**  = `1048576` bytes  
- **1 GB**  = `1073741824` bytes  
- **10 GB** = `10737418240` bytes  
- **100 GB** = `107374182400` bytes  
- **1 TB**  = `1099511627776` bytes  
- **10 TB** = `10995116277760` bytes  
- **100 TB** = `109951162777600` bytes  

### **Example Usage in Windows Command Prompt (`cmd`)**
To create a **1GB file** using `fsutil`, use:
```cmd
fsutil file createnew file.txt 1073741824
