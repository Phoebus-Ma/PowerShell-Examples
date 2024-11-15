
# Introduction
--------------

在密码学中，加密是以某种方式转换（更具体地说，编码）信息的过程。

加密对比哈希：

- 信息论角度：

    - Encryption是可逆的，没有信息熵的改变。
    - Hash是不可逆的，Hash一般会导致信息熵减小。

- 应用角度：

    - Encryption常被用来做基于密钥的数据加解密（AES、RSA、ECC）。
    - Hash主要被用来做数字签名、数据校验（CRC、SHA、MD5）。

- 小白角度：

    - Encryption就是带密码的保险箱。
    - Hash就是榨汁机，有去无回。


# Asymmetric Data Encryption Algorithms
---------------------------------------

## 1. Blum–Goldwasser (BG) cryptosystem.

Blum-Goldwasser 密码系统是一种概率公钥加密方案，由 Manuel Blum 和 Shafi Goldwasser 于 1984 年提出，包含三种算法，包括概率加密算法、确定性解密算法和概率密钥生成算法，用于生成公钥和私钥。这种语义安全的密码系统具有一致的密文扩展。由于它使用概率算法，BG 密码系统可以在每次加密一组明文时生成不同的密文。这是有利的，因为网络犯罪分子拦截使用 BG 算法加密的数据时无法将其与已知密文进行比较以解释数据。


## 2. Boneh–Franklin scheme.

Boneh-Franklin 方案是第一个实用的基于身份的加密 (IBE) 方案。Boneh-Franklin 方案由 Dan Boneh 和 Matthew K. Franklin 于 2001 年提出，基于群之间的双线性映射，例如椭圆曲线上的 Weil 对。Boneh-Franklin 方案中的私钥生成器 (PKG) 可以分布式，从而通过使用门限密码技术来确保主密钥永远不会出现在单个位置。


## 3. Cayley–Purser algorithm.

Cayley-Purser 算法由 Sarah Flannery 于 1999 年开发，其灵感来自 Michael Purser 在 1998 年青年科学家竞赛中提出的想法。该算法以 Purser 和发明矩阵的数学家 Arthur Cayley 的名字命名。Cayley-Purser 算法不使用模幂运算，而是仅使用模矩阵乘法。对于由 200 位数字组成的模数，​​它比 RSA 快 20 倍左右，对于大模数，它也是大多数其他公钥算法。然而，后来人们发现，使用 Cayley-Purser 算法加密的数据可以轻松使用公共数据知识解密。


## 4. CEILIDH.

CEILIDH 公钥密码系统基于 ElGamal 方案，具有类似的安全属性，由 Alice Silverberg 和 Karl Rubin 于 2003 年推出。CEILIDH 基于代数环面中的离散对数问题，与相同安全级别的基本方案相比，CEILIDH 的主要优势在于其密钥大小更小。该密码系统以 Alice Silverberg 的猫命名，其名称也是苏格兰盖尔语中用来描述传统苏格兰聚会的单词。


## 5. Cramer–Shoup cryptosystem.

Cramer-Shoup 密码体制是 Ronald Cramer 和 Victor Shoup 于 1998 年开发的 ElGamal 方案的扩展。与 ElGamal 相比，它加入了额外的元素以确保不可延展性，并且是第一个在标准模型中被证明能有效抵御选择密文攻击 (CCA) 的方案。


## 6. Crypto-PAn.

Crypto-PAn（基于密码术的前缀保留匿名化）是一种格式保留加密，用于匿名化 IP 地址，同时保留其子网结构。它由佐治亚理工学院的 Jinliang Fan、Jun Xu、Mostafa H. Ammar 和 Sue B. Moon 于 2002 年发明，灵感来自 Greg Minshall 于 1996 年开发的 TCPdpriv 程序，该程序采用了 IP 匿名化。据发现，Crypto-PAn 容易受到指纹识别和注入攻击。


## 7. Diffie-Hellman.

Diffie-Hellman 算法由 Whitfield Diffie 和 Martin Hellman 于 1976 年开发，是最早引入非对称加密概念的算法之一。Ralph Merkle 在一个名为“Ralph's Puzzles”的本科课程项目中引入了通过不安全渠道进行通信的一般概念，现在该算法被认为是公钥加密的最早示例之一。它也被称为 Diffie-Hellman 密钥交换，是一种数学方法，可让两个陌生的当事方通过公共渠道安全地交换加密密钥。虽然它是一种非认证密钥协商协议，但它是众多认证协议的基础。


## 8. Digital Signature Algorithm (DSA).

DSA 在公钥密码系统的框架下工作，基于模幂的代数性质以及离散对数问题，这被认为是计算上难以解决的。该算法使用由公钥和私钥组成的密钥对。私钥用于为消息生成数字签名，可以使用签名者的相应公钥来验证此类签名。数字签名提供消息认证（接收者可以验证消息的来源）、完整性（接收者可以验证消息自签名以来未被修改）和不可否认性（发送者不能错误地声称他们没有签署消息）。


## 9. El Gamal.

El Gamal 加密算法基于 Diffie-Hellman 密钥交换，由 Taher Elgamal 于 1985 年开发。该算法的安全强度基于求解离散对数的难度。一个缺点是 El Gamal 生成的密文长度是明文的两倍。但是，每次加密相同的明文时，它都会创建不同的密文。


## 10. Elliptic Curve Cryptography (ECC).

椭圆曲线密码术 (ECC) 是 Rivest-Shamir-Adleman (RSA) 加密算法的替代方案。顾名思义，它基于椭圆曲线理论，密钥是使用椭圆曲线方程性质生成的。它用于快速创建更小、更高效的加密密钥。求解椭圆曲线对数比因式分解更困难，因此与 RSA 和 Diffie-Hellman 相比，ECC 更难破解。ECC 通常用于电子邮件加密、软件和加密货币数字签名。


## 11. Elliptic Curve Digital Signature Algorithm (ECDSA).

在密码学中，椭圆曲线数字签名算法 (ECDSA) 是使用椭圆曲线密码学的数字签名算法 (DSA) 的变体。它是一种基于公钥密码学的非常有效的方程式。ECDSA 在许多安全系统中使用，在加密消息应用程序中很流行，并且是比特币安全的基础（比特币“地址”用作公钥）。


## 12. Efficient Probabilistic Public Key Encryption (EPOC).

高效概率公钥加密（EPOC）是一种概率公钥加密方案，有两种变体：EPOC-1 和 EPOC-2。两者都是使用单向陷门函数的公钥加密系统。EPOC-1 还使用随机哈希函数，而 EPOC-2 还使用两个哈希函数和对称密钥加密，例如分组密码。该加密方案由 T. Okamoto、S. Uchiyama 和 E. Fujisaki 于 1999 年开发，他们是一家名为 NTT Labs 的日本电信公司的专业人士。EPOC 在语义上是安全的，可以抵御选择密文攻击。


## 13. Falcon.

Falcon（NTRU 上的快速傅里叶格基紧凑签名的缩写）是一种后量子签名方案，由 Pierre-Alain Fouque、Jeffrey Hoffstein、Paul Kirchner、Vadim Lyubashevsky、Thomas Pornin、Thomas Prest、Thomas Ricosset、Gregor Seiler、William Whyte 和 Zhenfei Zhang 开发，他们于 2017 年将其提交给 NIST 的后量子密码学项目，并在第四轮中被选中。它基于由 Gentry、Peikert 和 Vaikuntanathan 开发的理论格基签名方案框架。它的签名比基于格基的签名方案更紧凑，但提供相同的安全性。Falcon 可以在一台普通计算机上每秒实现数千个签名，并以五到十倍的速度验证这些签名。


## 14. Goldwasser–Micali (GM) cryptosystem.

Goldwasser–Micali 密码系统由 Shafi Goldwasser 和 Silvio Micali 于 1982 年开发，他们提出了如今被广泛接受的语义安全定义。这是第一个在标准加密假设下被证明是安全的概率公钥加密方案。它并不以效率著称，因为 GM 密码系统创建的密文可能比原始明文大数百倍。


## 15. Hidden Fields Equations (HFE).

隐场方程，又称 HFE 陷门函数，于 1996 年在密码学研究会议 Eurocrypt 上首次提出。它由 Jacques Patarin 基于松本 zeta 函数和 Imai 系统的思想提出。它使用不同大小的多项式来隐藏私钥-公钥关系，而不是其他一些数据加密算法使用的有限域。


## 16. Kyber.

Kyber 是一种密钥封装方法 (KEM)，属于后量子密码学家族，旨在抵御未来可能通过量子计算机实现的密码分析攻击。它基于机器学习的带错误模块学习 (M-LWE) 和循环环。它由来自欧洲和北美的政府和研究机构的开发人员开发，源自 Oded Regev 于 2005 年发布的方法。Kyber 是代数格密码套件 (CRYSTALS) 的一部分，并集成到 Cloudflare、Amazon 和 IBM 的各种系统中或由其支持。


## 17. Lenstra–Lenstra–Lovász lattice basis reduction algorithm (LLL).

Lenstra–Lenstra–Lovász 格基约简算法由 Arjen Lenstra、Hendrik Lenstra 和 László Lovász 于 1982 年开发。在 LLL 最早的应用之一中，Andrew Odlyzko 和 Herman te Riele 用它来推翻了 Mertens 猜想。LLL 还被用于解决编码理论和密码分析问题，并成功破解了 RSA 和 DSA 的变体。


## 18. McEliece cryptosystem.

McEliece 密码系统由 Robert J. McEliece 于 1978 年发明，是第一个基于代码的公钥密码系统，也是第一个在加密过程中使用随机化的密码系统。这是一个单向系统，这意味着网络攻击者无法使用密文和公钥轻松找到随机选择的代码字。尽管几十年前就已推出，但它保持了相对稳定的安全性，并且可能在后量子密码学中占有一席之地，因为它可以抵御基于 Shor 算法的攻击。


## 19. Merkle–Hellman Knapsack cryptosystem.

Merkle-Hellman 背包密码系统由 Ralph Merkle 和 Martin Hellman 于 1978 年发明。然而，这种密码系统已被证明是不安全的，因为 Adi Shamir 于 1984 年发表了对基于 Shor 算法的 Merkle-Hellman 密码系统的成功攻击。该攻击无需私钥即可在多项式时间内解密消息。


## 20. Naccache–Stern cryptosystem.

Naccache–Stern 密码系统是一种同态密码系统，其安全性基于高剩余性问题。该密码系统由 David Naccache 和 Jacques Stern 于 1998 年发现，是一种可延展方案，这意味着可以将密文转换为另一个密文，然后解密为适当的明文。


## 21. Naccache–Stern Knapsack cryptosystem.

虽然名称相似，但 Naccache–Stern 背包密码系统与上述 Naccache-Stern 密码系统并不相同。Naccache–Stern 背包密码系统由 David Naccache 和 Jacques Stern 于 1997 年开发，是一种非典型公钥密码系统，具有确定性，但语义上不安全。它尚未被证明是安全的，尽管它尚未被完全破解。


## 22. Niederreiter cryptosystem.

Niederreiter 密码系统由 Harald Niederreiter 于 1986 年开发。它是 McEliece 密码系统的变体，提供与 McEliece 方案相同的安全级别，但速度大约快十倍。它基于纠错码，对密文使用综合征，对消息使用错误模式，Niederreiter 密码系统可用于数字签名方案。


## 23. NTRUEncrypt.

NTRUEncrypt 也称为 NTRU 加密算法，是 RSA 和 ECC 的替代方案。第一个版本 NTRU 由数学家 Jeffrey Hoffstein、Jill Pipher 和 Joseph H. Silverman 于 1996 年推出，他们后来与 David Lieman 一起创立了 NTRU Cryptosystems, Inc.。它基于格子中最短向量问题，据信该问题不受量子计算攻击的影响。它比其他一些非对称加密方案更快。


## 24. Okamoto–Uchiyama cryptosystem.

冈本-内山 (OU) 密码体制由 Tatsuaki Okamoto 和 Shigenori Uchiyama 于 1998 年提出。它是一种同态且可延展的方案，并且在语义上是安全的。


## 25. Paillier cryptosystem.

Paillier 密码系统于 199 年推出，以 Pascal Paillier 命名。它是一种基于决策复合剩余假设（一种难解性假设）的加法同态密码系统。它在语义上可以抵御选择明文攻击。


## 26. Rabin cryptosystem.

Rabin 密码体制基于与 RSA 陷门函数类似的陷门函数，其安全性基于整数分解的难度，是第一个伪造签名与分解因数一样困难的数字签名方案。陷门函数最初由 Michael O. Rabin 于 1978 年发表。


## 27. Rivest-Shamir-Adleman (RSA).

RSA 是一种广为人知且常用的非对称加密算法；事实上，它是互联网加密的标准。使用 RSA，可以使用公钥或私钥加密明文。如果信息使用公钥加密，则接收者必须拥有私钥才能解密，以确保只有预期的接收者才能访问数据。如果信息使用私钥加密，则接收者使用发送者的公钥解密，这可用于验证发送者的身份。但是，使用这种方法，数据可能会在传输过程中被盗、读取和修改，并且接收者必须知道如何验证数据的完整性。


## 28. Sakai–Kasahara scheme.

Sakai–Kasahara 方案，也称为 Sakai–Kasahara 密钥加密算法 (SAKKE)，是由 Ryuichi Sakai 和 Masao Kasahara 于 2003 年推出的 IBE 密码系统。任何人都可以在没有收件人公开身份（例如电子邮件地址）以外的信息的情况下使用 SAKKE 加密消息，因此用户不必共享公共证书。


## 29. Schmidt-Samoa cryptosystem.

施密特-萨摩亚密码系统 (SSC) 依赖于大整数分解问题的难度。它在处理解密时与 Rabin 和 RSA 一样快，但加密速度要慢得多。该方案由 Sakai 和 Kasahara 于 2003 年提出，2005 年，陈和程使用 Sakai-Kasahara 方案的简单版本和 Fujisaki-Okamoto 变换开发了一种高效的 IBE 方案，该方案被证明可以抵御选择密文。


## 30. Schoof–Elkies–Atkin algorithm.

Schoof–Elkies–Atkin 算法主要用于椭圆曲线密码学。它是 Schoof 算法（如下所述）的扩展，旨在提高 Noam Elkies 和 A. O. L. Atkin 开发的效率。


## 31. Schoof's algorithm.

Schoof 算法由 René Schoof 于 1985 年发表，是第一个用于计算椭圆曲线上点的确定性多项式时间算法。在 Schoof 算法之前，用于此目的的算法速度非常慢。


# Symmetric Data Encryption Algorithms
--------------------------------------

## 32. Advanced Encryption Standard (AES).

高级加密标准 (AES) 是一种对称分组密码，美国政府将其用于机密信息。1997 年，NIST 开始开发 AES，以应对数据加密标准 (DES，下文将讨论) 的替代方案需求，因为 DES 容易受到暴力攻击。AES 最有效的形式是使用 128 位密钥，但在需要强加密时也会使用 192 位和 256 位密钥。


## 33. Blowfish.

与 AES 一样，Blowfish 也是由 Bruce Schneier 于 1993 年开发的，用于替代 DES。它将消息分成 64 位块，然后分别加密每个块。它以快速、灵活而闻名，并且至今尚未被破解。


## 34. Camellia.

在密码学中，Camellia 是一种对称密钥分组密码，其分组大小为 128 位，密钥大小为 128、192 和 256 位。它由三菱电机和日本 NTT 联合开发。该密码设计为适用于软件和硬件实现，从低成本智能卡到高速网络系统。它是传输层安全性 (TLS) 加密协议的一部分，旨在通过互联网等计算机网络提供通信安全。


## 35. Cipher block chaining (CBC).

密码块链接 (CBC) 模式是 DES 的一种块模式，它将前一个加密的密文块与下一个要加密的明文块进行异或运算。它在加密过程中运行，其中每个明文块在加密之前与前一个密文块进行异或运算，以确保相同的明文块不会产生相同的密文。


## 36. Cipher Feedback (CFB).

密码反馈 (CFB) 是一种流模式加密技术，利用反馈消除模式，类似于 CBC。它使用初始化向量来破坏模式并传播错误。s


## 37. Counter (CTR).

计数器（CTR）模式是采用分组密码算法的典型分组密码操作模式。


## 38. Data Encryption Standard (DES).

DES（数据加密标准）是最初的对称加密算法之一，由 IBM 于 1977 年开发。最初，它是为美国政府机构开发并用于保护敏感的非机密数据。此加密方法包含在传输层安全性 (TLS) 版本 1.0 和 1.1 中。它从 64 位块创建两个 32 位块，并分别加密每个块，从而生成 64 位加密文本块。多年来，许多研究人员都破解了 DES，2005 年，它被 AES 取代，成为新标准。


## 39. Electronic Code Book (ECB)

电子密码本 (ECB) 是最简单的对称加密方案，也是最弱的方案，它会为每个明文块生成一个密文块。与 DES 一样，它将较大的块分成较小的块，然后分别加密。每次加密相同的明文时，它都会生成相同的密文，这意味着随着时间的推移，黑客会学会将一致的密文与等效的明文值对应起来，从而很容易破解它。


## 40. Format Preserving Encryption (FPE).

顾名思义，格式保留加密 (FPE) 会保留加密明文的原始格式。这对于数据必须采用特定格式但又必须安全的应用程序非常有用。一种被全球组织广泛使用的 FPE 方法（称为 FF3）遭到了攻击。因此，它不再被视为安全。


## 41. International Data Encryption Algorithm (IDEA)

国际数据加密算法 (IDEA) 是 1990 年由 Xuejia Lai 和 James Massey 根据与 Hasler 基金会签订的研究合同作为 DES 的替代方案推出的，该基金会后来成为 Ascom-Tech AG 的一部分。它最初被称为改进的拟议加密标准 (IPES)，是对先前的拟议加密标准 (PES) 概念的修订。


## 42. Multivariate Adaptive Regression Splines (MARS)

多元自适应回归样条函数 (MARS) 是 NIST 高级加密标准流程 (1997-2000) 的最终候选方案，旨在寻找可行的 DES 替代方案。MARS 最初由 Jerome Friedman 于 1991 年提出，是一种统计回归分析形式。它非常适合复杂的回归问题，其中存在变量输入和指标之间的非线性关系。


## 43. Output Feedback (OFB).

输出反馈 (OFB) 是一种在与明文进行异或之前使用子密钥的方法，不同于使用先前密文的密码反馈 (CFB)。此方法可防止错误传播，因为子密钥不受加密错误的影响。


## 44. QUAD.

QUAD 是一种可证明安全性的流密码。它由 Cˆome Berbain、Henri Gilbert 和 Jacques Patarin 于 2006 年欧洲密码大会上首次提出。


## 45. RC algorithms.

原始 RC 算法 RC1 由 Ron Rivest 开发，但从未发布过。它们也被称为 Rivest 密码或 Ron 代码。除了 RC1 之外，还有几个迭代版本，包括 RC2、RC3、RC4、RC5 和 RC6。RC5 于 1994 年推出，随后 RC6（主要基于 RC5）于 1997 年推出。


## 46. Serpent.

Serpent 是另一种分组密码，旨在替代 DES。该密码由 Ross Anderson、Eli Biham 和 Lars Knudsen 设计，曾入围 NIST 的 AES 竞赛。尽管 Serpent 使用的轮数是 DES 的两倍，但其速度却比 DES 快得多。


## 47. ShangMi 4 (SM4).

ShangMi 4 是中国国家无线局域网 WAPI（WLAN 身份验证和隐私基础设施）标准中使用的分组密码，也用于传输层安全。SM4 密码的密钥大小和分组大小均为 128 位。一个数据块的加密或解密由 32 轮组成。使用非线性密钥计划生成轮密钥，解密使用与加密相同的轮密钥，只是它们的顺序相反。


## 48. SNOW.

SNOW 由隆德大学的 Thomas Johansson 和 Patrik Ekdahl 开发，是一种基于字的同步流密码，已多次迭代，包括 SNOW 1.0、SNOW 2.0 和 SNOW 3G。Snow 3G 用于 4G 网络。


## 49. Threefish.

Threefish 是 Skein 哈希函数（下文将讨论）的分组密码，由 Bruce Schneier、Niels Ferguson、Stefan Lucks、Doug Whiting、Mihir Bellare、Tadayoshi Kohno、Jon Callas 和 Jesse Walker 于 2008 年开发。它是 NIST SHA-3 哈希函数竞赛的五个决赛选手之一。它因其速度而受到称赞，通过避免表查找和 S-Box 来抵御时序攻击。


## 50. Triple DES (3DES).

3 DES 又称为三重数据加密算法 (3DEA)，是原始 DES 的继承者，是在网络攻击者成功破解原始 DES 后开发的。它在 20 世纪 90 年代被广泛使用，但最终被更安全的算法所取代。


## 51. Twofish.

Twofish 是 John Kelsey、Chris Hall、Niels Ferguson、David Wagner、Doug Whiting 和 Bruce Schneier 设计的 Blowfish 的后继者，无论密钥大小如何，Twofish 都会在 16 轮内加密数据。Twofish 是此类别中最快的加密算法之一，用于许多现代文件加密软件工具，可用于硬件和软件。


# Hash Function Algorithms
--------------------------

## 52. BLAKE.

BLAKE 于 2008 年由 Jean-Philippe Aumasson、Luca Henzen、Willi Meier 和 Raphael C.-W. Phan 提交给 NIST 哈希函数竞赛，它基于 Daniel J. Bernstein 的 ChaCha 流密码。它是 NIST 哈希函数竞赛的五个决赛入围者之一。2012 年，Jean-Philippe Aumasson、Samuel Neves、Zooko Wilcox-O'Hearn 和 Christian Winnerlein 创建了改进版本 BLAKE 2，以替代 MD5 和 SHA-1。


## 53. Message Digest algorithm (MD5).

MD5（消息摘要算法）是一种哈希函数算法，是 SHA-3（下文讨论）的前身。MD 5 由 Ronald Rivest 于 1991 年开发，可将任意长度的消息转换为标准的 16 字节消息。


## 54. Fast syndrome-based hash functions (FSB).

2003 年，Daniel Augot、Matthieu Finiasz 和 Nicolas Sendrier 推出了基于快速综合征的哈希函数 (FSB)。它的独特之处在于，它被证明与解决常规综合征解码问题一样难以破解。常规综合征解码问题是一个 NP 完全问题，被认为在多项式时间内无法解决，这意味着它在一定程度上是可证明安全的。然而，早期的迭代最终被破解，但它的当前迭代被认为对所有目前已知的攻击都是安全的。FSB 的缺点是它占用大量内存，并且比其他哈希函数慢。


## 55. RIPE Message Digest (RIPEMD).

RIPEMD（RIPE 消息摘要）是一组加密哈希函数，于 1992 年（原始 RIPEMD）和 1996 年（其他变体）开发而成。该系列中有五个函数：RIPEMD、RIPEMD-128（128 位）、RIPEMD-160（160 位）、RIPEMD-256（256 位）和 RIPEMD-320（320 位），其中 RIPEMD-160 最为常见。


## 56. Secure Hashing Algorithm (SHA).

SHA-0：1993 年发布的 160 位哈希函数的原始版本的旧称，名称为“SHA”。由于未公开的“重大缺陷”，该版本在发布后不久就被撤回，并由稍作修改的版本 SHA-1 取代。

SHA-1：一种 160 位哈希函数，类似于早期的 MD5 算法。它由国家安全局 (NSA) 设计，作为数字签名算法的一部分。SHA-1 中发现了加密弱点，2010 年之后，该标准不再被批准用于大多数加密用途。

SHA-2：两个类似的哈希函数系列，具有不同的块大小，称为 SHA-256 和 SHA-512。它们的字长不同；SHA-256 使用 32 位字，而 SHA-512 使用 64 位字。每个标准都有一些简化版本，称为 SHA-224、SHA-384、SHA-512/224 和 SHA-512/256。这些版本也是由 NSA 设计的。

SHA-3：一种以前称为 Keccak 的哈希函数，在 2012 年非 NSA 设计师公开竞争后被选中。它支持与 SHA-2 相同的哈希长度，其内部结构与 SHA 系列的其他版本有很大不同。


## 57. Skein.

Skein 是 Niels Ferguson、Stefan Lucks、Bruce Schneier、Doug Whiting、Mihir Bellare、Tadayoshi Kohno、Jon Callas 和 Jesse Walker 开发的哈希函数系列，并提交给 NIST 的哈希算法竞赛。它基于 Threefish 设计，具有速度快、安全、简单和灵活等特点。


## 58. Tiger.

在密码学中，Tiger 是 Ross Anderson 和 Eli Biham 于 1995 年为提高 64 位平台的效率而设计的加密哈希函数。Tiger 基于 Merkle–Damgård 构造。单向压缩函数对 64 位字进行操作，维护 3 个字的状态并处理 8 个字的数据。共有 24 轮，使用 XOR 和加/减运算混合、旋转和 S 盒查找的组合，以及一个相当复杂的密钥调度算法，用于从 8 个输入字中派生出 24 个轮密钥。


## 59. Whirlpool.

在计算机科学和密码学中，Whirlpool（有时称为 WHIRLPOOL）是一种加密哈希函数。它由 Vincent Rijmen（高级加密标准的共同创建者）和 Paulo S. L. M. Barreto 设计，后者于 2000 年首次描述了它。Whirlpool 是 Square 分组密码之后设计的哈希，被认为属于该分组密码函数系列。Whirlpool 是一种基于经过大幅修改的高级加密标准 (AES) 的 Miyaguchi-Preneel 构造。


# Message Authentication Algorithms
-----------------------------------

## 60. Cipher-based message authentication code (CMAC).

一种使用对称密钥分组密码算法（如 AES）进行消息认证的加密技术。它通过生成固定大小的输出（称为标签或 MAC，与消息一起发送）来确保消息或数据的完整性和真实性。然后，接收方使用相同的密钥计算 CMAC 以验证消息的完整性。CMAC 具有防伪功能，广泛应用于各种安全协议和应用中。


## 61. Hash Message Authentication Code (HMAC).

哈希消息认证码 (HMAC) 是一种使用加密哈希函数和私有加密密钥的消息认证码 (MAC)。除了验证数据的完整性之外，HMAC 还可以验证消息的身份验证。由于密钥和消息是分开哈希处理的，因此它比标准 MAC 更安全。


## 62. Password-Based Key Derivation Function 2 (PBKDF2).

PBKDF2 是 RSA 实验室公钥密码标准 (PKCS) 系列的一部分，它取代了 PBKDF1，后者只能生成长度最多为 160 位的派生密钥。PBKDF2 将伪随机函数（例如基于哈希的消息认证码 (HMAC)）与盐值一起应用于输入的密码或密码短语，并重复该过程多次以生成派生密钥，然后可以在后续操作中将其用作加密密钥。增加的计算工作使密码破解变得更加困难，这被称为密钥拉伸。
