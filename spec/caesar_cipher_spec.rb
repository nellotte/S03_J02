require_relative '../lib/caesar_cipher.rb'
#il faut garder la meme casse apres le chiffrement
#il faut boucler
#si ce n'est pas une lettre, il ne faut pas appliquer la clé de conversion (ponctiation par exemple)

describe "caractere_to_ascii_conversion method" do
  it "should convert 'A' to [65]" do
    expect(caractere_to_ascii_conversion("A")).to eq([65])
  end

  it "should convert 'a' to [97]" do
    expect(caractere_to_ascii_conversion("a")).to eq([97])
  end

  it "should convert '!' to [33]" do
    expect(caractere_to_ascii_conversion("!")).to eq([33])
  end

  it "should convert '1' to [49]" do
    expect(caractere_to_ascii_conversion("1")).to eq([49])
  end
end

describe "new_ascii method" do
  it "should calculate a new ascii code for 'A' with n=1" do
    expect(new_ascii(65, 1)).to eq(66)
  end

  it "should calculate a new ascii code for 'z' with n=3" do
    expect(new_ascii(122, 3)).to eq(99)
  end

  it "should NOT calculate a new ascii code for '!' with n=5" do
    expect(new_ascii(33, 5)).to eq(33)
  end
end


describe "caesar_cipher method" do
  it "should encrypt 'Hello' to 'Khoor' with n=3" do
    expect(caesar_cipher("Hello", 3)).to eq("Khoor")
  end

  it "should encrypt 'abc XYZ' to 'bcd ABC' with n=1" do
    expect(caesar_cipher("abc XYZ", 1)).to eq("bcd YZA")
  end

  it "should NOT encrypt '123' with n=7" do
    expect(caesar_cipher("123", 7)).to eq("123")
  end
end

