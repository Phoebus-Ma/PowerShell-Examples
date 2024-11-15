
# Introduction
--------------

In cryptography, encryption is the process of transforming (more specifically, encoding) information in a way that.

Encryption VS hash.

- Information theory perspective:

    - Encryption is reversible, there is no change in information entropy.
    - Hash is irreversible, hash generally leads to a decrease in information entropy.

- Application perspective:

    - Encryption is often used for key-based data encryption and decryption (AES, RSA, ECC).
    - Hash is mainly used for digital signatures and data verification (CRC, SHA, MD5).

- Newbie perspective:

    - Encryption is a safe with a password.
    - Hash is a juicer, there is no return.


# Asymmetric Data Encryption Algorithms
---------------------------------------

## 1. Blum–Goldwasser (BG) cryptosystem.

The Blum-Goldwasser cryptosystem is a probabalistic public-key encryption scheme that was proposed back in 1984 by Manuel Blum and Shafi Goldwasser that comprises three algorithms, including a probabalistic encryption algorithm, a deterministic decryption algorithm, and a probabilistic key generation algorithm to produce a public key and a private key. This semantically-secure cryptosystem that has a consistent ciphertext expansion. As it uses a probabalistic algorithm, the BG cryptosystem can produce different ciphertexts each time a set of plaintext is encrypted. That is advantageous as cybercriminals intercepting data encrypted with the BG algorithm cannot compare it to known ciphertexts to interpret the data.


## 2. Boneh–Franklin scheme.

The Boneh-Franklin scheme was the first practical identity-based encryption (IBE) scheme. Proposed in 2001 by Dan Boneh and Matthew K. Franklin, the Boneh-Franklin scheme is based on bilinear maps between groups, such as the Weil pairing on elliptic curves. The Private Key Generator (PKG) in the Boneh-Franklin scheme can be distributed so that to ensure that the master key is never available in a single location by using threshold cryptography techniques.


## 3. Cayley–Purser algorithm.

The Cayley-Purser algorithm was developed by Sarah Flannery in 1999 and was inspired by Michael Purser's ideas for a Young Scientist competition in 1998. The algorithm is named after Purser and the mathematician who invented matrices, Arthur Cayley. Rather than modular exponentiation, the Cayley-Purser algorithm uses only modular matrix multiplication. It's about 20 times faster than RSA for a modulus consisting of 200 digits and is most other public-key algorithms for large moduli. However, it has since been discovered that data encrypted with the Cayley-Purser algorithm can be decrypted easily using knowledge of public data.


## 4. CEILIDH.

The CEILIDH public-key cryptosystem, which is based on the ElGamal scheme and has similar security properties, was introduced by Alice Silverberg and Karl Rubin in 2003. Based on the discrete logarithm problem in algebraic torus, CEILIDH's primary advantage is its reduced key size compared to basic schemes for the same level of security. Named after Alice Silverberg's cat, this cryptosystem's name is also a Scot Gaelic word to describe a traditional Scottish gathering.


## 5. Cramer–Shoup cryptosystem.

The Cramer–Shoup cryptosystem is an extension of the ElGamal scheme developed by Ronald Cramer and Victor Shoup in 1998. It incorporates additional elements compared to ElGamal to ensure non-malleability and was the first scheme proven to be effective at securing against chosen-ciphertext attack (CCA) in the standard model.


## 6. Crypto-PAn.

Crypto-PAn (Cryptography-based Prefix-preserving Anonymization) is a type of format-preserving encryption that's used to anonymize IP addresses while preserving the structure of their subnets. It was invented in 2002 by Jinliang Fan, Jun Xu, Mostafa H. Ammar from Georgia Tech, along with Sue B. Moon and was inspired by Greg Minshall's TCPdpriv program in 1996, which adopted IP anonymization. Crypto-PAn has been found to be vulnerable to fingerprinting and injection attacks.


## 7. Diffie-Hellman.

The Diffie-Hellman algorithm, developed by Whitfield Diffie and Martin Hellman in 1976, was one of the first to introduce the idea of asymmetric encryption. The general concept of communication over an insecure channel was introduced by Ralph Merkle in an undergraduate class project called Ralph's Puzzles, which is now deemed to be one of the earliest examples of public key cryptography. Also known as the Diffie-Hellman key exchange, it's a mathematical method that enables two unfamiliar parties to exchange cryptographic keys over a public channel securely. While it's a non-authenticated key-agreement protocol, it serves as the basis for numerous authenticated protocols.


## 8. Digital Signature Algorithm (DSA).

The DSA works in the framework of public-key cryptosystems and is based on the algebraic properties of modular exponentiation, together with the discrete logarithm problem, which is considered to be computationally intractable. The algorithm uses a key pair consisting of a public key and a private key. The private key is used to generate a digital signature for a message, and such a signature can be verified by using the signer's corresponding public key. The digital signature provides message authentication (the receiver can verify the origin of the message), integrity (the receiver can verify that the message has not been modified since it was signed) and non-repudiation (the sender cannot falsely claim that they have not signed the message).


## 9. El Gamal.

The El Gamal encryption algorithm, based on the Diffie-Hellman key exchange, was developed by Taher Elgamal in 1985. The security strength of this algorithm is based on the difficulty of solving discrete logarithms. One downside is that the ciphertext generated by El Gamal is two times the length of the plaintext. However, it creates a different ciphertext each time the same plaintext is encrypted.


## 10. Elliptic Curve Cryptography (ECC).

Elliptic Curve Cryptography (ECC) is an alternative to the Rivest-Shamir-Adleman (RSA) cryptographic algorithm. As its name suggests, it is based on the elliptic curve theory and keys are generated using elliptic curve equation properties. It's used to create smaller, more efficient encryption keys quickly. Solving elliptic curve logarithms is more difficult than factoring, making ECC more difficult to crack compared to RSA and Diffie-Hellman. ECC is commonly used for email encryption, software, and for cryptocurrency digital signatures.


## 11. Elliptic Curve Digital Signature Algorithm (ECDSA).

In cryptography, the Elliptic Curve Digital Signature Algorithm (ECDSA) offers a variant of the Digital Signature Algorithm (DSA) which uses elliptic-curve cryptography. It is a very efficient equation that is based on cryptography with public keys. ECDSA is utilized in many security systems, is popular in encrypted messaging apps, and is the foundation of Bitcoin security (with Bitcoin “addresses” serving as public keys).


## 12. Efficient Probabilistic Public Key Encryption (EPOC).

Efficient Probabilistic Public Key Encryption, known as EPOC, is a probabilistic public-key encryption scheme with two variations: EPOC-1 and EPOC-2. Both are public-key encryption systems that use a one-way trapdoor function. EPOC-1 also uses a random hash function, while EPOC-2 also uses two hash functions and symmetric-key encryption, such as block ciphers. This encryption scheme was developed in 1999 by T. Okamoto, S. Uchiyama and E. Fujisaki, who were professionals from a Japanese telecommunications company called NTT Labs. EPOC is semantically secure against chosen ciphertext attacks.


## 13. Falcon.

Falcon (an abbreviation for Fast Fourier lattice-based compact signatures over NTRU) is a post-quantum signature scheme developed by Pierre-Alain Fouque, Jeffrey Hoffstein, Paul Kirchner, Vadim Lyubashevsky, Thomas Pornin, Thomas Prest, Thomas Ricosset, Gregor Seiler, William Whyte, and Zhenfei Zhang, who submitted it to NIST's Post-Quantum Cryptography Project in 2017, where it was selected in the fourth round. It's based on the based on the theoretical lattice-based signature schemes framework developed by Gentry, Peikert and Vaikuntanathan. Its signatures are more compact than those of lattice-based signature schemes, yet it offers the same security. Falcon can implement thousands of signatures per second on a typical computer and verify those signatures five to ten times faster.


## 14. Goldwasser–Micali (GM) cryptosystem.

The Goldwasser–Micali cryptosystem was developed in 1982 by Shafi Goldwasser and Silvio Micali, who proposed the definition of semantic security that's widely accepted today. It was the first probabilistic public-key encryption scheme that was proven to be secure under standard cryptographic assumptions. It's not known for its efficiency, as the ciphertexts created by the GM cryptosystem can be hundreds of times larger than the original plaintext.


## 15. Hidden Fields Equations (HFE).

The Hidden Fields Equations, also known as HFE trapdoor function first introduced in 1996 at Eurocrypt, a cryptology research conference. It was proposed by Jacques Patarin based on the idea of the Matsumoto zeta functions and Imai system. It uses polynomials of different sizes to conceal the private-public key relationship, rather than the finite fields used by some other data encryption algorithms.


## 16. Kyber.

Kyber is a key encapsulation method (KEM) that's part of the Post Quantum Cryptography family and designed to resist cryptanalytic attacks that may someday be achieved with quantum computers. It's based on machine learning's module learning with errors (M-LWE) and cyclotomic rings. It was developed by developers from government and research institutions from Europe and North America and is derived from Oded Regev's method, which was published in 2005. Kyber is part of the Cryptographic Suite for Algebraic Lattices (CRYSTALS) and is integrated into or supported by various systems from Cloudflare, Amazon, and IBM.


## 17. Lenstra–Lenstra–Lovász lattice basis reduction algorithm (LLL).

The Lenstra–Lenstra–Lovász lattice basis reduction algorithm was developed by Arjen Lenstra, Hendrik Lenstra and László Lovász in 1982. In one of the earliest applications of LLL, Andrew Odlyzko and Herman te Riele used it to disprove Mertens conjecture. LLL has also been used to solve coding theory and cryptanalysis problems and has successfully broken variants of RSA and DSA.


## 18. McEliece cryptosystem.

The McEliece cryptosystem, introduced by Robert J. McEliece in 1978, was the first code-based public-key cryptosystem and the first to use randomization in the encryption process. It's a one-way system, which means that cyberattackers can't easily find a randomly chosen code word using a ciphertext and public key. Despite being introduced decades ago, it maintains relatively stable security and may have a place in post-quantum cryptography as it withstands attacks based on Shor's algorithm.


## 19. Merkle–Hellman Knapsack cryptosystem.

The Merkle–Hellman Knapsack cryptosystem was introduced in 1978 by Ralph Merkle and Martin Hellman. This cryptosystem has been proven to be insecure, however, as Adi Shamir published a successful attack on the Merkle-Hellman cryptosystem based on Shor's algorithm in 1984. The attack decrypts messages in polynomial time without the private key.


## 20. Naccache–Stern cryptosystem.

The Naccache–Stern cryptosystem is a homomorphic cryptosystem that bases its security on the higher residuosity problem. Discovered by David Naccache and Jacques Stern in 1998, it's a malleable scheme, meaning that a ciphertext can be transformed into another ciphertext that decrypts to the appropriate plaintext.


## 21. Naccache–Stern Knapsack cryptosystem.

While the name is similar, the Naccache–Stern Knapsack cryptosystem is not the same as the Naccache-Stern cryptosystem described above. The Naccache–Stern Knapsack cryptosystem, developed in 1997 by David Naccache and Jacques Stern, is an atypical pubic-key cryptosystem that is deterministic and not semantically secure. It has not been proven secure, although it hasn't yet been fullybroken.


## 22. Niederreiter cryptosystem.

The Niederreiter cryptosystem was developed in 1986 by Harald Niederreiter. A variation of the McEliece cryptosystem, it offers the same level of security as the McEliece scheme, but it's about ten times faster. It's based on error correcting codes and uses a syndrome for ciphertext and an error pattern for the message, the Niederreiter cryptosystem can be used for digital signature schemes.


## 23. NTRUEncrypt.

NTRUEncrypt, also known as the NTRU encryption algorithm, is an alternative to RSA and ECC. The first version, NTRU, was introduced in 1996 by mathematicians Jeffrey Hoffstein, Jill Pipher, and Joseph H. Silverman, who later founded NTRU Cryptosystems, Inc. along with David Lieman. It's based on the shortest vector problem in a lattice, which is believed to be immune to quantum computing attacks. It's faster than some other asymmetric encryption schemes.


## 24. Okamoto–Uchiyama cryptosystem.

The Okamoto–Uchiyama (OU) cryptosystem was introduced by Tatsuaki Okamoto and Shigenori Uchiyama in 1998. It's a homeomorphic and malleable scheme, and it's semantically secure.


## 25. Paillier cryptosystem.

The Paillier cryptosystem was introduced in 199 and is named for Pascal Paillier. It's an additive homomorphic cryptosystem based on the decisional composite residuosity assumption, an intractibility hypothesis. It is semantically secure against chosen plaintext attacks.


## 26. Rabin cryptosystem.

The Rabin cryptosystem is based on a trapdoor function similar to RSA's trapdoor function, and its security is based on the difficulty of integer factorization, and it was the first digital signature scheme in which forging a signature was as difficult as factoring. The trapdoor function was originally published in 1978 by Michael O. Rabin.


## 27. Rivest-Shamir-Adleman (RSA).

RSA is a widely known and commonly used asymmetric encryption algorithm; in fact, it's the standard for encryption over the internet. With RSA, plaintext can be encrypted using either the public or private key. If information is encrypted using the public key, the recipient must have the private key to decrypt it, ensuring that only the intended recipient will gain access to the data. If information is encrypted using the private key, the recipient uses the sender's public key to decrypt it, which can be used to verify the sender's identity. However, using this method, the data could be stolen, read, and modified while in transit, and the recipient would have know way to verify the data's integrity.


## 28. Sakai–Kasahara scheme.

The Sakai–Kasahara scheme, also known as the Sakai–Kasahara key encryption algorithm (SAKKE), is an IBE cryptosystem introduced in 2003 by Ryuichi Sakai and Masao Kasahara. Anyone can encrypt a message with SAKKE when having no information other than the recipient's public identity, such as their email address, so the users don't have to share public certificates.


## 29. Schmidt-Samoa cryptosystem.

The Schmidt-Samoa cryptosystem (SSC) relies on the difficulty of the large integer factorization problem. It's as fast as Rabin and RSA for processing decryption, but encryption is much slower. Proposed by Sakai and Kasahara in 2003, and in 2005, Chen and Cheng developed an efficient IBE scheme using a simple version of the Sakai-Kasahara scheme and the Fujisaki-Okamoto transformation that was proven to be secure against chosen ciphertexts.


## 30. Schoof–Elkies–Atkin algorithm.

The Schoof–Elkies–Atkin algorithm is primarily used in elliptic curve cryptography. It's an extension of Schoof's algorithm (discussed below) to improve efficiency developed by Noam Elkies and A. O. L. Atkin.


## 31. Schoof's algorithm.

Schoof's algorithm was published by René Schoof in 1985 and was the first deterministic polynomial time algorithm to count points on an elliptic curve. Before Schoof's algorithm, the algorithms used for this purpose were incredibly slow.


# Symmetric Data Encryption Algorithms
--------------------------------------

## 32. Advanced Encryption Standard (AES).

The Advanced Encryption Standard (AES) is a symmetric block cipher that's used for classified information by the U.S. government. Development of AES began in 1997 by NIST in response to the need for an alternative to the Data Encryption Standard (DES, discussed below) due to its vulnerability to brute-force attacks. In its most efficient form, it uses 128-bit keys, although it also uses 192- and 256-bit keys when robust encryption is necessary.


## 33. Blowfish.

Like AES, Blowfish was developed in 1993 by Bruce Schneier as an alternative to DES. It breaks messages into 64-bit blocks, encrypting each block separately. It's known to be fast, flexible, and has yet to be broken.


## 34. Camellia.

In cryptography, Camellia is a symmetric key block cipher with a block size of 128 bits and key sizes of 128, 192 and 256 bits. It was jointly developed by Mitsubishi Electric and NTT of Japan. The cipher was designed to be suitable for both software and hardware implementations, from low-cost smart cards to high-speed network systems. It is part of the Transport Layer Security (TLS) cryptographic protocol designed to provide communications security over a computer network such as the Internet.


## 35. Cipher block chaining (CBC).

Cipher Block Chaining (CBC) mode is a block mode of DES that XORs the previous encrypted block of ciphertext to the next block of plaintext to be encrypted. It operation in encryption where each block of plaintext is XOR'd with the previous block of ciphertext before encryption, ensuring that identical plaintext blocks do not produce the same ciphertext.


## 36. Cipher Feedback (CFB).

Cipher Feedback (CFB) is a stream mode encryption technique that utilizes feedback to eliminate patterns, similar to CBC. It employs an initialization vector to disrupt patterns and propagate errors.


## 37. Counter (CTR).

The Counter (CTR) mode is a typical block cipher mode of operation using block cipher algorithm.


## 38. Data Encryption Standard (DES).

The DES (data encryption standard) is one of the original symmetric encryption algorithms, developed by IBM in 1977. Originally, it was developed for and used by U.S. government agencies to protect sensitive, unclassified data. This encryption method was included in Transport Layer Security (TLS) versions 1.0 and 1.1. It creates two 32-bit blocks from a 64-bit block and encrypts each block separately, producing 64-bit blocks of encrypted text. DES was broken by many researchers over the years and in 2005, it was replaced by AES as the new standard.


## 39. Electronic Code Book (ECB)

Electronic Code Book (ECB) is the simplest symmetric encryption scheme and also the weakest, producing a block of ciphertext for each block of plaintext. Like DES, it separates larger blocks into smaller blocks and encrypts them individually. It produces the same ciphertext every time the same plaintext is encrypted, meaning that it's crackable over time as hackers learn to correspond the consistent ciphertext with the equivalent plaintext values.


## 40. Format Preserving Encryption (FPE).

As its name suggests, Format Preserving Encryption (FPE) preserves the original format of the plaintext it encrypts. This is beneficial in applications in which data must be in a particular format but also must be secure. An attack was discovered on an FPE method widely used by organizations around the world, known as FF3. As such, it's no longer considered secure.


## 41. International Data Encryption Algorithm (IDEA)

The International Data Encryption Algorithm (IDEA) was introduced in 1990 by Xuejia Lai and James Massey as an alternative to DES under a research contract with the Hasler Foundation, which became part of Ascom-Tech AG. Originally called Improved Proposed Encryption Standard (IPES), it's a revision of a previous concept called the Proposed Encryption Standard (PES).


## 42. Multivariate Adaptive Regression Splines (MARS)

Multivariate Adaptive Regression Splines (MARS) was a finalist in the NIST's Advanced Encryption Standard Process (1997-2000) in the search for a viable DES alternative. MARS was originally introduced by Jerome Friedman in 1991 as a form of regression analysis for statistics. It's well-suited for complex regression problems in which there are variable inputs and non-linear relationships between metrics.


## 43. Output Feedback (OFB).

Output Feedback (OFB) is a method where the subkey is used before being XORed to the plaintext, unlike Cipher Feedback (CFB) where the previous ciphertext is used. This approach prevents error propagation as the subkey remains unaffected by encryption errors.


## 44. QUAD.

QUAD is a stream cipher with provable security. It was first introduced at Eurocrypt 2006 by Cˆome Berbain, Henri Gilbert, and Jacques Patarin.


## 45. RC algorithms.

The original RC algorithm, RC1, was developed by Ron Rivest, albeit never published. They're also known as Rivest's cipher or Ron's code. There are several iterations in addition to RC1, including RC2, RC3, RC4, RC5, and RC6. RC5 was introduced in 1994, followed by RC6 (which was heavily based on RC5) in 1997.


## 46. Serpent.

Serpent is another block cipher developed as a potential replacement for DES. Designed by Ross Anderson, Eli Biham and Lars Knudsen, it was a finalist in NIST's AES competition. Despite using two times the number of rounds necessary to block all known shortcut attacks, Serpent is significantly faster than DES.


## 47. ShangMi 4 (SM4).

ShangMi 4 is a block cipher used in the Chinese National Standard for Wireless LAN WAPI (WLAN Authentication and Privacy Infrastructure) and also used with Transport Layer Security. The SM4 cipher has a key size and a block size of 128 bits each. Encryption or decryption of one block of data is composed of 32 rounds. A non-linear key schedule is used to produce the round keys and the decryption uses the same round keys as for encryption, except that they are in reversed order.


## 48. SNOW.

Developed by Thomas Johansson and Patrik Ekdahl at Lund University, SNOW is a word-based synchronous stream cipher with several iterations, including SNOW 1.0, SNOW 2.0, and SNOW 3G. Snow 3G is used on 4G networks.


## 49. Threefish.

Threefish is a block cipher for the Skein hash function (discussed below) developed in 2008 by Bruce Schneier, Niels Ferguson, Stefan Lucks, Doug Whiting, Mihir Bellare, Tadayoshi Kohno, Jon Callas, and Jesse Walker. It was one of five finalists in NIST's SHA-3 hash function competition. Praised for its speed, it withstands timing attacks by avoiding table lookups and S-Boxes.


## 50. Triple DES (3DES).

Also known as Triple Data Encryption Algorithm, or 3DEA, 3 DES is the successor to the original DES and was developed as a result of cyberattackers successfully breaching the original DES. It was widely used in the 1990s but eventually was upstaged by more secure algorithms.


## 51. Twofish.

A successor to Blowfish designed by John Kelsey, Chris Hall, Niels Ferguson, David Wagner, Doug Whiting, and Bruce Schneier, Twofish encrypts data in 16 rounds regardless of the key size. Known as one of the fastest encryption algorithms in this category, it's used for many modern file encryption software tools and can be used for both hardware and software.


# Hash Function Algorithms
--------------------------

## 52. BLAKE.

Submitted to the NIST hash function competition by Jean-Philippe Aumasson, Luca Henzen, Willi Meier, and Raphael C.-W. Phan in 2008, BLAKE is based on Daniel J. Bernstein's ChaCha stream cipher. It was one of five finalists in the NIST hash function competition. An improved version, BLAKE 2, was created in 2012 by Jean-Philippe Aumasson, Samuel Neves, Zooko Wilcox-O'Hearn, and Christian Winnerlein as a replacement for MD5 and SHA-1.


## 53. Message Digest algorithm (MD5).

MD5 (Message Digest algorithm) is a hash function algorithm that was a predecessor SHA-3 (discussed below). Developed by Ronald Rivest in 1991, MD 5 converts a message of any length to a standard 16-byte message.


## 54. Fast syndrome-based hash functions (FSB).

Fast syndrome-based hash functions (FSB) were introduced in 2003 by Daniel Augot, Matthieu Finiasz, and Nicolas Sendrier. It's unique in that it is proven that it's as difficult to break as solving the regular syndrome decoding problem. Regular syndrome decoding problem is a NP-complete problem that's assumed to be unsolvable in polynomial time, meaning that it's provably secure to an extent. However, early iterations were eventually broken, but it's current iteration is deemed secure to all currently known attacks. The downside to FSB is that it uses a lot of memory and is slower than other hash functions.


## 55. RIPE Message Digest (RIPEMD).

RIPEMD (RIPE Message Digest) is a family of cryptographic hash functions developed in 1992 (the original RIPEMD) and 1996 (other variants). There are five functions in the family: RIPEMD, RIPEMD-128 (128 bits), RIPEMD-160 (160 bits), RIPEMD-256 (256 bits), and RIPEMD-320 (320 bits), of which RIPEMD-160 is the most common.


## 56. Secure Hashing Algorithm (SHA).

SHA-0: A retronym applied to the original version of the 160-bit hash function published in 1993 under the name "SHA". It was withdrawn shortly after publication due to an undisclosed "significant flaw" and replaced by the slightly revised version SHA-1.

SHA-1: A 160-bit hash function which resembles the earlier MD5 algorithm. This was designed by the National Security Agency (NSA) to be part of the Digital Signature Algorithm. Cryptographic weaknesses were discovered in SHA-1, and the standard was no longer approved for most cryptographic uses after 2010.

SHA-2: A family of two similar hash functions, with different block sizes, known as SHA-256 and SHA-512. They differ in the word size; SHA-256 uses 32-bit words where SHA-512 uses 64-bit words. There are also truncated versions of each standard, known as SHA-224, SHA-384, SHA-512/224 and SHA-512/256. These were also designed by the NSA.

SHA-3: A hash function formerly called Keccak, chosen in 2012 after a public competition among non-NSA designers. It supports the same hash lengths as SHA-2, and its internal structure differs significantly from the rest of the SHA family.


## 57. Skein.

Skein is a hash function family developed by Niels Ferguson, Stefan Lucks, Bruce Schneier, Doug Whiting, Mihir Bellare, Tadayoshi Kohno, Jon Callas, and Jesse Walker and submitted to the NIST's hash algorithm competition. It is designed based on Threefish to offer speed, security, simplicity, and flexibility.


## 58. Tiger.

In cryptography, Tiger is a cryptographic hash function designed by Ross Anderson and Eli Biham in 1995 for efficiency on 64-bit platforms. Tiger is based on Merkle–Damgård construction. The one-way compression function operates on 64-bit words, maintaining 3 words of state and processing 8 words of data. There are 24 rounds, using a combination of operation mixing with XOR and addition/subtraction, rotates, and S-box lookups, and a fairly intricate key scheduling algorithm for deriving 24 round keys from the 8 input words.


## 59. Whirlpool.

In computer science and cryptography, Whirlpool (sometimes styled WHIRLPOOL) is a cryptographic hash function. It was designed by Vincent Rijmen (co-creator of the Advanced Encryption Standard) and Paulo S. L. M. Barreto, who first described it in 2000. Whirlpool is a hash designed after the Square block cipher, and is considered to be in that family of block cipher functions. Whirlpool is a Miyaguchi-Preneel construction based on a substantially modified Advanced Encryption Standard (AES).


# Message Authentication Algorithms
-----------------------------------

## 60. Cipher-based message authentication code (CMAC).

A cryptographic technique for message authentication using a symmetric key block cipher algorithm such as AES. It provides integrity and authenticity for messages or data by producing a fixed-size output, known as a tag or MAC, which is sent along with the message. The receiver then computes the CMAC using the same secret key to verify the integrity of the message. CMAC is resistant to forgery and is widely used in various security protocols and applications.


## 61. Hash Message Authentication Code (HMAC).

    Hash Message Authentication Code (HMAC) is a message authentication code (MAC) that uses a cryptographic hash function along with a private cryptographic key. In addition to verifying the integrity of the data, HMAC can also verify the message's authentication. As the key and the message are hashed separately, it's more secure than standard MAC.


## 62. Password-Based Key Derivation Function 2 (PBKDF2).

PBKDF2 is part of RSA Laboratories' Public-Key Cryptography Standards (PKCS) series, It supersedes PBKDF1, which could only produce derived keys up to 160 bits long. PBKDF2 applies a pseudorandom function, such as hash-based message authentication code (HMAC), to the input password or passphrase along with a salt value and repeats the process many times to produce a derived key, which can then be used as a cryptographic key in subsequent operations. The added computational work makes password cracking much more difficult, and is known as key stretching.
