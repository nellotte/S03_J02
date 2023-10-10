#programme qui prend en paramètres un string et une clé de chiffrement 
#(nombre de lettres à décaler) pour en sortir le string modifié (str, n)

#on a un str en entrée, pour chaque caractere il faut determiner le code ascii
#exclure certains codes ascii pour ne pas appliquer la clé de conversion
#sinon on applique la conversion en fonction du n (qui est le nombre de lettre à décaler)

def caractere_to_ascii_conversion (str)
  split_letter = str.split("") # Divise la chaîne 'str' en une liste de lettres individuelles
  split_ascii = [] # Crée une liste vide pour stocker les codes ASCII
  split_letter.each do |letter| 
    split_ascii << letter.ord  #Ajoute le code ASCII de chaque lettre à la liste
  end
  return split_ascii # Renvoie la liste des codes ASCII
end
caractere_to_ascii_conversion("abc")

def new_ascii(ascii, n)
  if (65 <= ascii && ascii <= 90) # si ascii est une Majuscule
    new_ascii_code = ascii + n
    if new_ascii_code > 90 #pour boucler et revenir à A
      new_ascii_code = new_ascii_code - 26 
    end
  elsif (97 <= ascii && ascii <= 122) # si ascii est une Minuscule
    new_ascii_code = ascii + n
    if new_ascii_code > 122 #pour boucler et revenir à A
      new_ascii_code = new_ascii_code - 26
    end
  else
    new_ascii_code = ascii # Si ce n'est pas une lettre, on renvoie le même code ASCII
  end
  return new_ascii_code
end

def caesar_cipher(str, n)
  ascii_table = caractere_to_ascii_conversion(str) # Convertit la chaîne en une liste de codes ASCII
  new_table = [] # Crée une liste vide pour stocker les nouveaux caractères
  ascii_table.each do |i|
    new_table << new_ascii(i, n).chr # Applique le décalage et ajoute le caractère correspondant
  end
  puts new_table.join("") # Affiche la chaîne résultante
  return new_table.join("") # Renvoie la chaîne résultante
end

caesar_cipher("Mm!'()", 4)
caesar_cipher("ABCDEFGHIJKLMNOPQRSTUVWXYZ!'()", 1)
caesar_cipher("abcdefghijklmonopqrstuvwxyz",1)