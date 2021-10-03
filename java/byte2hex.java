class byte2hex {


public static final String byteArray2hexString(byte[] abyte0, int i, int j) {
        StringBuffer stringbuffer = new StringBuffer();

        for(int k = i; k < i + j; ++k) {
            String s = Integer.toHexString(abyte0[k] & 255).toUpperCase();
            if(s.length() == 1) {
                stringbuffer.append("0" + s);
            } else {
                stringbuffer.append(s);
            }
        }

        return stringbuffer.toString();
    }

  
  public static void main (String[] args){
    byte[] data = "sample data".toBytes();
    String hexData = byteArray2hexString(data,0,data.length());
    System.out.println(hexData);
  }
}
