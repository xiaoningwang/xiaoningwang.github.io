%%
%% Copyright 2007-2020 Elsevier Ltd
%%
%% This file is part of the 'Elsarticle Bundle'.
%% ---------------------------------------------
%%
%% It may be distributed under the conditions of the LaTeX Project Public
%% License, either version 1.2 of this license or (at your option) any
%% later version.  The latest version of this license is in
%%    http://www.latex-project.org/lppl.txt
%% and version 1.2 or later is part of all distributions of LaTeX
%% version 1999/12/01 or later.
%%
%% The list of all files belonging to the 'Elsarticle Bundle' is
%% given in the file `manifest.txt'.
%%
%% Template article for Elsevier's document class `elsarticle'
%% with harvard style bibliographic references

\documentclass[preprint,12pt,authoryear]{elsarticle}

%% Use the option review to obtain double line spacing
%% \documentclass[authoryear,preprint,review,12pt]{elsarticle}

%% Use the options 1p,twocolumn; 3p; 3p,twocolumn; 5p; or 5p,twocolumn
%% for a journal layout:
%% \documentclass[final,1p,times,authoryear]{elsarticle}
%% \documentclass[final,1p,times,twocolumn,authoryear]{elsarticle}
%% \documentclass[final,3p,times,authoryear]{elsarticle}
%% \documentclass[final,3p,times,twocolumn,authoryear]{elsarticle}
%% \documentclass[final,5p,times,authoryear]{elsarticle}
%% \documentclass[final,5p,times,twocolumn,authoryear]{elsarticle}

%% For including figures, graphicx.sty has been loaded in
%% elsarticle.cls. If you prefer to use the old commands
%% please give \usepackage{epsfig}

%% The amssymb package provides various useful mathematical symbols
\usepackage{amssymb}
\usepackage{amsmath}
\usepackage{graphicx}
\usepackage{tabularx}
\usepackage{multirow}
\usepackage{array,color}
\usepackage{booktabs}
%% The amsthm package provides extended theorem environments
%% \usepackage{amsthm}
\usepackage{algorithm} 
\usepackage{algpseudocode}
\usepackage{algorithmic} % algorithmic
%% The lineno packages adds line numbers. Start line numbering with
%% \begin{linenumbers}, end it with \end{linenumbers}. Or switch it on
%% for the whole article with \linenumbers.
%% \usepackage{lineno}

\journal{Electronic Commerce Research}

\begin{document}

\begin{frontmatter}

%% Title, authors and addresses

%% use the tnoteref command within \title for footnotes;
%% use the tnotetext command for theassociated footnote;
%% use the fnref command within \author or \affiliation for footnotes;
%% use the fntext command for theassociated footnote;
%% use the corref command within \author for corresponding author footnotes;
%% use the cortext command for theassociated footnote;
%% use the ead command for the email address,
%% and the form \ead[url] for the home page:
%% \title{Title\tnoteref{label1}}
%% \tnotetext[label1]{}
%% \author{Name\corref{cor1}\fnref{label2}}
%% \ead{email address}
%% \ead[url]{home page}
%% \fntext[label2]{}
%% \cortext[cor1]{}
%% \affiliation{organization={},
%%            addressline={},
%%            city={},
%%            postcode={},
%%            state={},
%%            country={}}
%% \fntext[label3]{}

\title{Brand Competitive Analysis Using Multimodal Topic Models}
%Multi-Brand Competitive Analysis through Multimodal Dynamic Topic Modeling}
%Multimodal Comparative Analysis Across Multiple Corpora Using Dynamic Topic Models

\author[label1]{Xiaoning Wang}
\author[label2,label3]{Xiaoling Lu }
\author[label3]{Yuxuan Guo}
\author[label3]{Li'ao Zhu}
\author[label2,label3]{Feifei Wang\corref{cor1}}
%\author[label2]{Yucun Chen}
%\author[label3]{Yichao Feng}

\ead{feifei.wang@ruc.edu.cn}

\cortext[cor1]{The corresponding author}
\address[label1]{School of Data Science and Media Intelligence, Communication University of China}
\address[label2]{Center for Applied Statistics, Renmin University of China}
\address[label3]{School of Statistics, Renmin University of China}

%\address[label3]{JD Health International Inc.}


\begin{abstract}
{

Brand competitive analysis is crucial for businesses to understand their market position and develop strategies to outperform competitors. As consumer behavior and market trends evolve, companies increasingly rely on data-driven insights to stay ahead. In this context, online reviews on e-commerce platforms offer a wealth of information, providing valuable opportunities for analyzing consumer sentiment and preferences. With the rise of multimodal reviews (combining both text and images), it has become essential to harness these diverse data sources effectively. To address this need, we first propose a multimodal and multi-corpora latent Dirichlet allocation (MM-LDA) model for static data. It uncovers both general topics and brand-specific topics, enabling fine-grained insights into consumer concerns and brand positioning. We further extend MM-LDA into a dynamic framework and propose the multimodal and multi-corpora dynamic topic model (MM-DTM), which incorporates temporal dynamics to capture topic evolution over time. We demonstrate the effectiveness of our approaches using datasets from ZOL and Baidu Tieba discussions, highlighting their ability to mine multimodal reviews, reveal brand-specific trends, and provide real-time insights into brand competitiveness.


%Brand competitive analysis is crucial for businesses to understand their market position and develop strategies to outperform competitors. As consumer behavior and market trends evolve, companies increasingly rely on data-driven insights to stay ahead. In this context, online reviews on e-commerce platforms, social media interactions, and user-generated content provide a wealth of information, offering valuable opportunities for analyzing consumer sentiment, preferences, and brand positioning. With the rapid development of information technology and the popularization of the Internet, dynamic multiple corpora data—ranging from e-commerce platform reviews to social media discussions—have become an integral part of brand analysis. Effectively processing and analyzing these vast and heterogeneous datasets has drawn increasing attention from researchers.

%To address this need, we propose a multimodal and multiple corpora dynamic topic model (MM-DTM), which unifies multimodal data fusion, multiple corpora analysis, and temporal dynamic analysis within an advanced topic modeling framework. 

%Unlike previous studies that primarily focus on either multilingual, multimodal, or dynamic models separately, our approach integrates textual and visual content simultaneously while capturing the temporal evolution of topics across multiple brand datasets. The SIFT algorithm is used for multimodal fusion, extracting meaningful features from images, while Gibbs Sampling and Kalman filtering are employed to infer model parameters and track dynamic topic changes over time.

%We demonstrate the effectiveness of our proposed model using datasets from the Baidu Tieba discussions, highlighting its capability to mine multimodal reviews, uncover brand-specific trends, and provide real-time insights into brand competitiveness. %Experimental comparisons with traditional Dynamic Topic Models (DTM) and Latent Dirichlet Allocation (LDA) confirm that our model achieves superior performance in topic extraction across multiple corpora. By analyzing and interpreting the model’s results, we extract meaningful conclusions that reinforce its practical application in competitive brand analysis, providing businesses with a powerful tool for strategic decision-making in a rapidly changing digital landscape.
}

\end{abstract}

\iffalse
%%Graphical abstract
\begin{graphicalabstract}
\includegraphics[width=1\textwidth]{pic_11.png}
\end{graphicalabstract}

%%Research highlights
\begin{highlights}
\item Research highlight 1: The most significant innovation of this paper is the integration of multimodal and multiple corpora analysis with temporal dynamic analysis within the framework of topic modeling. This integration aims to explore the similarities and differences in topic modeling among various corpora at different times, as well as the changes in topics over time. Consequently, the improvements made in this study can more accurately reflect the real dynamics and discrepancies of topics in actual data.
\item Research highlight 2: Empirical analyses were performed on three datasets from Baidu Post Bar, where the model proposed in this study was compared with baseline models to establish its superiority. Additionally, the analysis of the model's topics outputs provided insights into the similarities and differences among different corpus, as well as the dynamic changes in the topics over time.
\end{highlights}
\fi

\begin{keyword}
%% keywords here, in the form: keyword \sep keyword
Brand Competitive Analysis \sep Dynamic Analysis \sep Multimodal Analysis  \sep Social Media \sep Topic Models 
%% PACS codes here, in the form: \PACS code \sep code

%% MSC codes here, in the form: \MSC code \sep code
%% or \MSC[2008] code \sep code (2000 is the default)

\end{keyword}

\end{frontmatter}

%% \linenumbers

%% main text
\section{Introduction}
\label{}


In today’s competitive marketplace, brand competitive analysis is critical for businesses to assess their market position and craft strategies to outperform competitors. This analysis helps businesses identify their strengths and weaknesses, discover market opportunities, and refine strategies to excel in the face of competition. By evaluating their performance relative to rivals, companies can optimize their product offerings, customize marketing strategies, and improve customer engagement, ultimately fostering growth and sustaining their relevance in the market.

With the widespread use of social media and e-commerce platforms, businesses can now access vast amounts of dynamic, multimodal data, including text, images, and videos. These platforms offer consumers the opportunity to express their opinions in a rich and diverse manner, creating valuable sources of data for brand competitive analysis. On e-commerce platforms, reviews often provide detailed descriptions of products or services, reflecting performance, quality, and user experience. By analyzing these reviews, businesses can gain deep insights into how their products are perceived relative to competitors. This data helps identify consumer preferences, market trends, and pain points, which in turn can refine product offerings, improve customer satisfaction, and enhance brand positioning. Additionally, reviews highlight emerging trends and shifts in consumer sentiment, enabling businesses to adjust their strategies proactively and maintain a competitive edge.

As consumers increasingly use images alongside text to express opinions, multimodal reviews are becoming an important source of information for businesses. Images are particularly valuable because they offer a deeper level of engagement and can influence purchase decisions more effectively than text alone. Compared to traditional text reviews, multimodal reviews play an increasingly important role in enhancing user experience, influencing purchase decisions and promoting brand interaction and marketing \citep{luo2015examining,you2016cross,villarroel2019words}. For instance, Ma et al., (2018) utilized deep learning methods to extract text and image features, demonstrating how image features enhance the accuracy of usefulness prediction \citep{ma2018effects}. Similarly, Li et al., (2023) treated images as auxiliary variables and studied their impact on review helpfulness, showing that reviews with images are more helpful \citep{li2023let}. These studies indicate that incorporating image information can significantly improve the accuracy of review mining tasks based on traditional text information.

Existing studies on multimodal review mining have predominantly concentrated on analyzing single corpora, with relatively little attention given to the joint analysis of multiple corpora. This limitation poses a challenge for brand competitive analysis, as it often involves data from multiple brands. Therefore, analyzing multiple corpora is crucial for a comprehensive understanding of brand competitiveness. Addressing the issue of multi-corpora review mining, particularly in the context of brand competitive analysis, Wang et al. (2018) introduced an approach based on Latent Dirichlet Allocation (LDA) to extract information from two corpora of competing products \citep{wang2018topic}. While this model enables separate analysis of multiple corpora, it does not distinguish between aspect-related word clusters and sentiment-related word clusters within each topic. Building on this research, Guo et al. (2022) developed the Brand Joint LDA (BJ-LDA) model, which is specifically designed for mining multi-brand corpora \citep{guo2022mining}. The BJ-LDA model can identify both general topics shared across brands and specific topics unique to each brand, providing deeper insights for brand competitive analysis. However, current research on multi-corpora review mining predominantly focuses on textual data, with comparatively less emphasis on multimodal data.

%Despite the growing recognition of the value of multimodal reviews, most existing research has focused on analyzing single corpora. This limits the ability to fully understand brand competitiveness across multiple brands or platforms.

To address the challenge of comparing multiple brands using multimodal reviews, we first develop a multimodal and multi-corpora latent Dirichlet allocation (MM-LDA) model for static review data. The MM-LDA model simultaneously processes multiple corpora to extract a range of topics, including both general topics shared across all brands and specific topics unique to individual brands. This dual-level analysis enables a more deeper understanding of similarities and differences of brands. To enhance the analysis, the model integrates both textual and visual information. It incorporates Scale-Invariant Feature Transform (SIFT) image feature extraction and K-means clustering to analyze image comments alongside textual data \citep{qiang2017topic}. By combining these modalities, the MM-LDA model provides a richer and more comprehensive view of the topics discussed in the reviews. Each topic is represented through two distinct clusters: one for textual data and one for visual data. Furthermore, to handle dynamic reviews and capture the temporal evolution of topics, we further extend the model into a dynamic framework, resulting in the multimodal and multi-corpora dynamic topic model (MM-DTM). The effectiveness of the MM-LDA and MM-DTM models is demonstrated through extensive case studies on two datasets: the ZOL mobile phone dataset and the Baidu Tieba discussion dataset. These case studies illustrate the capability of the two models to reveal insightful general topics across all brands as well as specific topics for individual brands. 
%The results highlight the ability of MMLDA to deliver a thorough analysis of brand competition by leveraging both textual and visual information, offering valuable insights for brand strategy and consumer behavior analysis.

%To address this gap, we propose a Multimodal Multi-corpora Dynamic Topic Model (MM-DTM), a novel approach that simultaneously analyzes multiple corpora of text and images across dynamic datasets. Our model extends traditional Dynamic Topic Models (DTMs) by incorporating multimodal data, thus enhancing the depth and applicability of competitive analysis. Unlike existing approaches that typically focus on either static data, multimodal fusion, or dynamic aspects individually, the MM-DTM model integrates these features into a unified framework. It uses the SIFT algorithm for feature extraction and Kalman filtering for temporal dynamics, offering real-time insights into the evolving nature of brand discussions across platforms like social media and e-commerce.

%By analyzing data from multiple brands in a competitive market, the MM-DTM model enables a comparative analysis of thematic differences across corpora, revealing brand-specific strengths and weaknesses. The model captures both general topics that span multiple brands and brand-specific topics, providing a comprehensive view of brand competition. This dual-level analysis—incorporating both textual and visual information—gives businesses a deeper understanding of their market position, helping them craft strategies based on consumer trends and brand perceptions. Through case studies using the ZOL mobile phone dataset and Baidu Tieba discussions, we show the effectiveness of the MM-DTM in providing actionable insights into consumer behavior, brand interactions, and competitive advantages.


The rest of the paper is organized as follows: Section 2 provides a comprehensive literature review. Section 3 details the proposed MM-LDA and MM-DTM. Section 4 presents experiments conducted on the ZOL dataset, while Section 5 covers experiments on the Baidu Tieba dataset. Finally, Section 6 concludes the paper with a brief discussion.


\section{Related work}
%Our work is related to the studies of topic models, multimodal learning and multiple corpora topic model. In this section, we review the related literature.

\subsection{Researches of Brand Competitive Analysis}

Brand competitive analysis can be approached from various perspectives. In this section, we focus on the analysis based on reviews. From this angle, brand comparison can be conducted using multi-corpora analysis methods, which is a crucial research area with significant implications for understanding and comparing multiple datasets. One key approach within this field is comparative summarization methods, which are particularly effective for analyzing documents on similar topics and identifying differences between them. These methods support decision-making and provide valuable insights for multi-corpora analysis. For instance, linear programming methods \citep{huang2011comparative} and discriminatory sentence recognition methods \citep{wang2013comparative} have been proposed for comparative mining in purely textual data. In the context of online reviews, Sipos and Joachims (2013) introduced an innovative objective function to pair review fragments from multiple corpora, enabling the identification of sentences that compare similar features \citep{sipos2013generating}.

Latent Dirichlet Allocation (LDA) is a prominent method for extracting thematic information from text, making it a key tool for text context mining \citep{blei2003latent}. Several models based on LDA have been developed for multi-corpora analysis. For example, \cite{wang2018topic} proposed an LDA-based model to analyze two competing brands from a topic perspective. This model effectively analyzes two separate corpora and leverages review data to its full extent. Building on this, Guo et al. (2022) introduced a brand-focused LDA model, mining both shared and unique topics among different brands to facilitate comprehensive brand analysis \citep{guo2022mining}. This approach allows for comparing the strengths and weaknesses of various brands. Additionally, Zhu et al. (2022) defined a special relationship between two text corpora called the ``lead-lag relationship" and proposed a dynamic topic model to uncover this relationship. By recognizing the lead-lag relationship, the model improves the similarity assessment between the two corpora and enhances the quality of topic modeling in both \citep{2022Zhu}.



\subsection{Research on Multimodal Learning}
Multimodal representation methods are an actively researched area, primarily divided into two categories: traditional multimodal representation methods and deep learning approaches. In traditional multimodal representation techniques, \cite{LI2022104559} differentiate categories of linguistic content to encode textual information, then utilize open tools to extract interpretable features such as color and image quality, and encode images. \cite{2022Multimodal} emphasizes enhancing audio and visual features under the guidance of textual semantics, showcasing a method where text modality's global semantics improve the representation learning of audio and visual encoders. By leveraging multimodal interactions, the study demonstrates improved emotion recognition performance, suggesting a nuanced approach to integrating multimodal information.

Within the deep learning framework for multimodal representation, \cite{2019ViLBERT} proposed a dual-stream architecture for processing visual and linguistic inputs separately, with shared transformer layers for fusion. This design facilitated effective cross-modal interactions, significantly improving performance across various vision-and-language tasks. \cite{2021Visual} proposed Contrastive Language–Image Pre-training (CLIP) to demonstrate how pre-training on large-scale image-text pairs could yield a versatile visual-linguistic representation capable of zero-shot or few-shot learning across multiple visual tasks.CLIP's success highlighted the potential of large-scale cross-modal data pre-training. \cite{2023MLNet} addresses the challenge of named entity recognition in social media texts by incorporating visual information along with textual content. By employing adaptive co-attentive networks and salient visual attention models, researchers have significantly improved the accuracy of text feature extraction. However, deep learning-based approaches to multimodal representation typically suffer from poor interpretability and a high dependency on large-scale training datasets.

And in the study of topic models for multimodal data, \cite{2003Modeling} is one of the representative and foundational multimodal topic models, which assumes a one-to-one correspondence between the topics of textual and image modalities. \cite{2010Multimodal} presented an image annotation method that combines topic regression with multimodal LDA, utilizing LDA to analyze image content and integrating topic regression techniques to enhance the accuracy and relevance of image annotations. \cite{2018MMDF-LDA} proposed an improved multimodal LDA model (MMDF-LDA) for annotating images on social media. This model integrates the visual features of images with associated textual data, using LDA to identify and label key topics and concepts within images, thereby improving the precision and efficiency of annotating social media content. \cite{2023Multimodal} introduced the Social Media Multimodal Topic Model (SMMTM) to specifically address the intricacies of short texts within social media, using SIFT algorithm for processing images. This model operates on the assumption that a given document's text aligns with a single topic, whereas its associated images may pertain to multiple topics. \cite{2023Li} processed images using the SIFT algorithm, transforming them into visual words, then combined this with textual data for LDA topic modeling. The results of the topic model were ultimately applied to downstream tasks such as tag classification, improving the outcomes of the topic model and the accuracy of classification tasks.

\subsection{Research on Dynamic Topic Models}

Topic model is a statistical model that clusters the implicit semantic structures of a corpus in an unsupervised learning manner and is mainly used for semantic analysis and text mining problems in natural language processing. Early topic models include Latent Semantic Indexing \citep[LSI,][]{1998LSI} and Probabilistic LST \citep[PLST,][]{1999PLSI}, then Blei proposed Latent Dirichlet Allocation \citep[LDAm,][]{2003LDA} to mine implicit topics and information in text data, which is widely used and derived various models such as \cite{2006Pachinko} proposed pachinko allocation model(PAM) to capture arbitrary, nested, and possibly sparse correlations between topics using a directed acyclic graph.

Topic evolution is also an important issue, and the most recognized work is the dynamic topic model. In the research on dynamic topic models, based on the types of temporal variables, they can be categorized into three main classes. The first class is discrete-time dynamic topic models, with the representative model being the Dynamic Topic Model (DTM) introduced by \cite{2006Dynamic}. This model is pioneering in the field of dynamic topic modeling, defining a temporal evolution factor to control the evolution of topic word distributions over adjacent time slices, revealing how different topics evolve over time. The second class is continuous-time dynamic topic models, with the representative model being the continuous DTM (cDTM) by \cite{2012Continuous}, which employs Brownian motion to model the variation of topics over time. The third class is online dynamic topic models, with \cite{2010Online} propose Online LDA being the representative model. Online LDA extends the original LDA model to an online setting. \cite{2015DTM} showcases the application of DTMs in analyzing online consumer reviews to monitor market competition. Their work highlights DTMs' potential in extracting actionable insights from temporal text data in the business domain.


\iffalse
\subsection{Research on Multiple corpora analysis}
In the field of multiple corpora research, \cite{2009Sun} build a sentiment-based product feature database to compare various products at the feature level from both subjective and objective perspectives, and proposing product recommendations based on the comparison results.\cite{2010Jointly} innovated within topic models by using sentences as the basic units, incorporating background topics, aspect topics, and opinion topics, and categorizing topics into general (shared) and specific (unique) types. This approach facilitated the extraction of topics and corresponding sentiments from corpora. \cite{WANG2018} propose a latent Dirichlet allocation (LDA)-based model analysing two competitive brands from a topic perspective. The
model could analyse two separate corpora and make full use of review data. \cite{2022Guo} further introduced the concept of brands, mining shared and unique topics among different brands and conducting brand analysis based on the results of the topic model. This approach allowed for a comparison of the strengths and weaknesses between various brands. \cite{2022Zhu} defined a special type of relationship between two text corpora called "lead-lag relationship" and proposed a jointly dynamic topic model to discover the lead-lag relationship, with the recognized lead-lag relationship, the similarities of the two text corpora can be figured out and the quality of topic learning in both corpora can be improved.
\fi

\section{Methodology}
\label{}


\subsection{Multimodal Multi-corpora LDA(MMLDA)}

To fully leverage the rich and diverse information from multiple multimodal corpora for brand competitive analysis, we introduce the MMLDA model in this section. As illustrated in Figure~\ref{fig:multi_lda_structure}, the MMLDA model comprises two main steps. Since the review data analyzed by MMLDA includes both text and images, the first step involves aligning these two modalities for effective analysis. Specifically, for image data, we utilize the Scale-Invariant Feature Transform (SIFT) method \citep{lowe2004distinctive} and K-means clustering to convert images into visual Bag-of-Words (BoW) representations. In contrast, processing textual data is more straightforward. After some conventional text preprocessing steps, the text is transformed into a BoW format. The BoW representations of both image and text modalities are then integrated and analyzed in the second step, which involves estimating the MMLDA model. Step 2 of Figure~\ref{fig:multi_lda_structure} provides a brief topic structure of MMLDA, with a detailed construction present in Figure~\ref{fig:multilda}. This model is designed to uncover both general topics that are common across multiple corpora and specific topics unique to each corpus. Each topic is characterized by two distinct clusters of words: one for textual content (the corresponding distribution is $\Phi^{T}$) and one for visual content (the corresponding distribution is $\Phi^{I}$). By analyzing these general and specific topics, the model facilitates a deeper understanding of the relationships and differences among the multiple corpora.

In the following sections, we will first describe the process of generating BoW representations for images and texts (Step 1). Once we have obtained the BoW representations, we will proceed to establish the MMLDA model (Step 2). The model structure of MMLDA will be detailed in the next, and the detailed estimation method is left in Appendix A.


\begin{figure}[h]
	\centering
	\includegraphics[width=0.9\linewidth]{MMLDA.png}
	\caption{The MMLDA Framework.}
	\label{fig:multi_lda_structure}
\end{figure}

%Next, we introduce some necessary notations. Suppose the studied product categories involve $B$ different brands. For brand $b$, the number of documents is defined as $D_b$, where $b$ ranges from $1$ to $B$. The textual vocabulary size from all texts for brand $b$ is denoted as $V_b^T$. Similarly, the image vocabulary size from the visual BoW data extracted by images is denoted as $V_b^I$. Summarizing all brands corpora, the total textual vocabulary size of the entire corpus is $V^T$, the total image vocabulary size is $V^I$, and the total number of documents is $D$. Further assume there are $K_0$ general topics, and each brand $b$ has $K_b$ specific topics.  The task of this work is to extract the word distributions of $K_b$ specific topics and $K_0$ general topics from the observed documents.

\subsubsection{Generating BoW Representations}

Before estimating the MMLDA model, we need to generate BoW representations for both text and image data. For textual data, the process of generating BoW is relatively straightforward. Typically, we remove stop words, filter out low-frequency words, and eliminate numbers. This approach is generally sufficient for text. However, for image data, the process is more complex. Thus in the following, we will focus on the process of generating BoW representations for images. Here we basically apply the Bag-of-Visual-Words (BoVW) method to process image information, which is a classic approach for image representation and widely used in image retrieval and classification \citep{yang2007evaluating,kato2014image}. Unlike generating BoW representations for texts, BoVW encodes images based on the statistical frequency of visual words and involves three main steps: (1) feature extraction using the SIFT method, (2) K-means clustering, and (3) statistical distribution representation. First, the SIFT algorithm \citep{lowe2004distinctive} identifies keypoints in images and extracts 128-dimensional feature vectors from these points. We use the opencv library in Python to extract up to 100 keypoints per image. Figure~\ref{fig:SIFT_sample} shows the keypoints of one image on the ZOL smartphone dataset, which we analyze in Section 4. It demonstrates that, the SIFT method can effectively identify significant features from images.




\begin{figure}[h]
	\centering
	\includegraphics[width=0.8\linewidth]{sift2.png}
	\caption{Illustration for SIFT Extraction}
	\label{fig:SIFT_sample} %% label for entire figure
\end{figure}


Next, the SIFT features are processed using the K-means clustering method to construct a visual vocabulary, with each cluster centroid representing a visual word. Assume the number of clusters to be $\widetilde{K}$, which can be determined based on model perplexity and topic coherence metrics. Then each image is represented by $\widetilde{K}$ visual words. These visual words are aggregated to form a visual word list for the image modality of each review, facilitating subsequent topic modeling analysis. Finally, we generate a frequency histogram to represent the distribution of visual words within each image.
%If the most frequent visual word in an image exceeds the second most frequent by 10\%,
Then the image would be categorized by the dominant visual word. Table~\ref{tal:image_word_meaning} presents some examples of the computed visual words in the ZOL dataset. It is obvious that, images classified under the same visual word category exhibit similar meanings, validating the effectiveness of this workflow in extracting interpretable visual vocabulary for multimodal topic modeling.


\begin{table}[htp]
	\centering
	\caption{Examples of the Computed Visual Words in the ZOL Dataset }
	\resizebox{\linewidth}{!}{
	\begin{tabular}{ccccc}
		\hline
		\multicolumn{2}{c|}{Visual Word 1} & \multicolumn{3}{c}{Practical illustration：system configuration} \\ \hline
		\rule{0pt}{3cm} % 增加行高
		\includegraphics[width=0.18\linewidth]{15_1.jpg}                 & \includegraphics[width=0.18\linewidth]{15_3.jpg}                & \includegraphics[width=0.18\linewidth]{15_4.jpg}            & \includegraphics[width=0.18\linewidth]{15_2.jpg}            & \includegraphics[width=0.18\linewidth]{15_5.jpg}           \\ \hline
		\multicolumn{2}{c|}{Visual Word 2}  & \multicolumn{3}{c}{Practical illustration：phone screen display} \\ \hline
		\rule{0pt}{3cm} % 增加行高
		\includegraphics[width=0.18\linewidth]{5_1.jpg}                 & \includegraphics[width=0.18\linewidth]{5_2.jpg}                & \includegraphics[width=0.18\linewidth]{5_3.jpg}            & \includegraphics[width=0.18\linewidth]{5_4.jpg}            & \includegraphics[width=0.18\linewidth]{5_5.jpg}           \\ \hline
		\multicolumn{2}{c|}{Visual Word 3} & \multicolumn{3}{c}{Practical illustration：the taken photos} \\ \hline
		\rule{0pt}{3cm} % 增加行高
		\includegraphics[width=0.18\linewidth]{21_1.jpg}                 & \includegraphics[width=0.18\linewidth]{21_2.jpg}                & \includegraphics[width=0.18\linewidth]{21_3.jpg}            & \includegraphics[width=0.18\linewidth]{21_4.jpg}            & \includegraphics[width=0.18\linewidth]{21_5.jpg}           \\ \hline
		\multicolumn{2}{c|}{Visual Word 4} & \multicolumn{3}{c}{Practical illustration：phone appearance design} \\ \hline
		\rule{0pt}{3cm} % 增加行高
		\includegraphics[width=0.18\linewidth]{33_1.jpg}                 & \includegraphics[width=0.18\linewidth]{33_2.jpg}                & \includegraphics[width=0.18\linewidth]{33_3.jpg}            & \includegraphics[width=0.18\linewidth]{33_4.jpg}            & \includegraphics[width=0.18\linewidth]{33_5.jpg}           \\ \bottomrule\hline
	\end{tabular}
}
	\label{tal:image_word_meaning}
\end{table}



\subsubsection{The Generative Process of MMLDA}

MMLDA aims to extract both general and specific topics from multiple corpora, each containing two modalities: textual and image data. First, we introduce some necessary notations. Suppose one product category involves $B$ different brands. For brand $b$, the number of documents is defined as $D_b$, where $b$ ranges from $1$ to $B$. The textual vocabulary size for all texts from brand $b$ is denoted as $V_b^T$. Similarly, the visual vocabulary size from the visual BoW data extracted from images is denoted as $V_b^I$. Summarizing the corpora of all brands, the total textual vocabulary size is $V^T$, the total visual vocabulary size is $V^I$, and the total number of documents is $D$.

Furthermore, we assume the existence of general topics shared across all brands, as well as specific topics corresponding to each brand. Specifically, we assume there are $K_0$ general topics across all $D$ review documents. Each general topic corresponds to two clusters: one for textual words and one for image visual words. This model structure aids in exploring common interests across all brands. Additionally, for each brand $b$, where $b \in \{1, 2, \ldots, B\}$, we assume there are $K_b$ specific topics, with different brands having different numbers of specific topics. These $K_b$ specific topics consist of $K_b$ clusters of textual words specific to the brand and $K_b$ clusters of image visual words specific to the brand. Other notations in MMLDA are summarized in Table \ref{tabl:lda_meaning}.

\begin{table}[htp]
    \centering
    \caption{Notations in MMLDA}
    \renewcommand\arraystretch{1.2}
    \resizebox{\linewidth}{!}{
    \begin{tabular}{llll}
        \hline
        \textbf{Symbol}        & \textbf{Meaning} & \textbf{Symbol}        & \textbf{Meaning}   \\ \hline
        $B$                & Number of brands         & $K_0$              & Number of general topics         \\
        $K_b$              & Number of specific topics in brand $b$    & $\beta$            & Dirichlet prior        \\
        $D$                & Total number of documents        & $D_b$              & Number of documents in brand $b$       \\
        $V^T$                & Total number of textual words        & $V_b^T$              & Number of specific textual words in brand $b$       \\
        $V^I$                & Total number of image visual words        & $V_b^I$              & Number of specific image visual words in brand $b$       \\
        $p$                & Parameter of Bernoulli distribution     & $\gamma$           & Parameter of Beta distribution        \\
        $N_{d,n}$          & Word in document     & $\alpha$           & Dirichlet prior        \\
        $\Phi^{T,g}_{k}$   & General textual word distribution    & $\Phi^{I,g}_{k}$   & General image visual word distribution       \\
        $\Phi^{T,s}_{k_b}$ & Specific textual word distribution     & $\Phi^{I,s}_{k_b}$ & Specific image visual word distribution       \\
        $\theta_{d_b}^g$   & General topic distribution      & $\theta^{s}_{d_b}$ & Specific topic distribution        \\
        $Z_{d_b,n}^g$      & Indicator of general topic of word     & $Z_{d_b,n}^s$      & Indicator of specific topic of word       \\
        $w_{d_b,n}^I$      & Observed image visual word    & $u_{d_b,n}^I$      & Indicator of general/specific image visual word \\
        $w_{d_b,n}^T$      & Observed textual word    & $u_{d_b,n}^T$      & Indicator of general/specific textual word \\ \hline
    \end{tabular}
    }
    \label{tabl:lda_meaning}
\end{table}


%The probability graph is illustrated in Figure~\ref{fig:multilda}.


Based on the above notations, we present the generative process of MMLDA, which is summarized in Figure~\ref{fig:multilda}. We first draw word distributions of each general topic from Dirichlet prior with hyperparameters $\beta$. For each general topic $k \in \{1,...,K_0\}$, there are two types of words distributions: one on textual vocabulary, which is denoted by $\Phi^{T,g}_{k}$, and the other on image visual vocabulary, which is denoted by $\Phi^{I,g}_{k}$. Then for each brand $b$, we draw word distributions of its $K_b$ specific topics from Dirichlet prior with hyperparameters $\beta_b$. There are also two types of word distributions on each specific topic $k_b\in \{1,...,K_b\}$: one on textual vocabulary, which is denoted by $\Phi^{T,s}_{k_b}$, and the other on image visual vocabulary, which is denoted by $\Phi^{I,s}_{k_b}$.

\begin{figure}[htp]
	\centering
	\includegraphics[width=0.6\textwidth]{multilda.png}
	\caption{The Generation Process of MMLDA}
	\label{fig:multilda}
\end{figure}

Next, similar to the standard LDA model, for each review document $d$ in brand $b$, we draw two document-topic distributions: one general document-topic distribution $\theta_{d_b}^g \sim \text{Dir}(\alpha_g)$ and one specific document-topic distribution $\theta_{d_b}^s \sim \text{Dir}(\alpha_s)$, where $\text{Dir}(\cdot)$ denotes the Dirichlet distribution and $\alpha_g$ and $\alpha_s$ are hyperparameters. Next, we draw topic indicators $z_{d_b,n}^g \sim \text{Multi}(\theta_{d_b}^g)$ and $z_{d_b,n}^s \sim \text{Multi}(\theta_{d_b}^s)$ for each textual word $w_{d_b,n}^T$ and image visual word $w_{d_b,n}^I$ in document $d$.
The $n$-th textual word $w_{{d_b},n}^T$ in document $d$ can describe either a general word or a specific word. It is similar for the $n$-th image visual word $w_{{d_b},n}^I$ in document $d$. Thus we introduce two indicator variables $u_{{d_b},n}^T$ and $u_{{d_b},n}^I$ to distinguish between the types of textual word $w_{{d_b},n}^T$ and image visual word $w_{{d_b},n}^I$. Take the textual modality as an example. Let $u_{{d_b},n}^T$ follows the $(0,1)$ Bernoulli distribution with parameter $p$, where $p$ follows the Beta distribution with hyperparameter $\gamma$. Then the extraction of $w_{{d_b},n}^T$ and $w_{{d_b},n}^I$ is generated as follows:




\begin{equation*}
	w_{{d_b},n}^T \sim \left \{
	\begin{array}{ll}
		\text{Multi}(\Phi^{T,g}_{z^g_{d_b,n}})   & \text{if} \ u_{{d_b},n}^T=0  \\
		\text{Multi}(\Phi^{T,s}_{z^s_{d_b,n}})   & \text{if} \ u_{{d_b},n}^T=1 \\
	\end{array}
	\right.
\end{equation*}

\begin{equation*}
	w_{{d_b},n}^I \sim \left \{
	\begin{array}{ll}
		\text{Multi}(\Phi^{I,g}_{z^g_{d_b,n}})   & \text{if} \ u_{{d_b},n}^I=0  \\
		\text{Multi}(\Phi^{I,s}_{z^s_{d_b,n}})   & \text{if} \ u_{{d_b},n}^I=1 \\
	\end{array}
	\right.
\end{equation*}

The generation process of MMLDA model can be summarized in Algorithm ~\ref{algo:mmlda}.


% \begin{algorithm}
%     \caption{Generation process of MMLDA}
%     \footnotesize
%     \begin{algorithmic}
%         \State \textbf{Step 1: Generate word distributions for topics}
%         \For{the general topic $k \in \{1,2,3,\cdots,K_0\}$}
%         \State Generate its textual-word distribution $\phi_{k}^{T,g} \sim Dir(\beta)$
%         \State Generate its general visual-word distribution $\phi_{k}^{I,g} \sim Dir(\beta)$
%         \EndFor
%         \For{the corpus $b \in \{1,2,\cdots,B\}$}
%             \For{the specific topic $k_b \in \{1,2,\cdots,K_b\}$}
%             \State Generate its textual-word distribution $\phi_{k_b}^{T,s} \sim Dir(\beta_b)$
%              \State Generate its visual-word distribution $\phi_{k_b}^{I,s} \sim Dir(\beta_b)$
%             \EndFor
%         \EndFor

%         \State \textbf{Step 2: Generate topic distributions for documents}
%         \For{the corpus $b \in \{1,2,\cdots,B\}$}
%             \For{the document $d$ in corpus $b$}
%             \State Generate its general topic distribution $\theta_{d}^{g} \sim Dir(\alpha_g)$
%              \State Generate its specific topic distribution $\theta_{d_b}^{s} \sim Dir(\alpha_s)$
%             \EndFor
%         \EndFor
%         \State \textbf{Step 3: Generate observed textual and image visual words}
%         \For{the textual word $w_{d_b,n}^T$ in each document}
%         \State Sample its general topic indicator $z_{d,n}^g \sim Multi(\theta_{d}^{g})$
%         \State Sample its specific topic indicator $z_{d_b,n}^{s} \sim Multi(\theta_{d_b}^{s})$
%          \State Sample the general-or-specific indicator $u_{d_b,n}^T \sim Bernoulli(p)$ with $p \sim Beta(\gamma)$
%          \If{$u_{d_b,n}^T = 0$ (describing the general topic)}
%             %\State
%             $w_{d_b,n}^T \sim Multi(\phi_{z_{d,n}}^{T,g})$
%          \Else $\ w_{d_b,n}^T \sim Multi(\phi_{z_{d_b,n}}^{T,s})$
%         \EndIf
%         \EndFor
%         \For{the visual word $w_{d_b,n}^I$ in document}
%         \State Sample its general topic indicator $z_{d,n}^g \sim Multi(\theta_{d}^{g})$
%          \State Sample its specific topic indicator $z_{d_b,n}^{s} \sim Multi(\theta_{d_b}^{s})$
%           \State Sample the general-or-specific indicator $u_{d_b,n}^I \sim Bernoulli(p)$ with $p \sim Beta(\gamma)$
%         \If{$u_{d_b,n}^I = 0$ (describing the general topic)}
%         %\State
%         $w_{d_b,n}^I \sim Multi(\phi_{z_{d,n}}^{I,g})$
%         \Else
%         $\ w_{d_b,n}^I \sim Multi(\phi_{z_{d_b,n}}^{I,s})$
%         \EndIf
%         \EndFor
%     \end{algorithmic}
%     \label{algo:mmlda}
% \end{algorithm}







\subsection{Multimodal Multiplecorpora Dynamic Topic Model (MM-DTM)}

Since the data we analyze includes both text and image modalities, we first discuss how to process the images. For image processing, we utilize the Bag of Visual Words (BOVW) model, which is a foundational approach for automated image representation \citep{yang2007evaluating,kato2014image}. BOVW has three main stages: extracting features using the Scale Invariant Feature Transform (SIFT), clustering with K-means, and generating representations.% as illustrated in Figure \ref{Fig.2}.

%\begin{figure}
%	\centering %图片居中
%	\includegraphics[width=0.7\textwidth]{pic_1.png}
%	\caption{Illustration of the BOVW Algorithm. {\color{magenta}need change}} %最终文档中希望显示的图片标题
%	\label{Fig.2} %用于文内引用的标签
%\end{figure}


First, SIFT identifies distinct local features in images, known for its efficiency and robustness across various research domains \citep{lowe2004distinctive}. The process begins with the detection of keypoints that capture essential information from local regions of the image. It then employs a difference-of-Gaussian function to locate these keypoints in scale-space. Subsequent steps involve deriving distinctive descriptors for these keypoints by evaluating the gradient magnitudes and orientations around them. These descriptors, represented as $L$-dimensional vectors (e.g., $L = 128$), encapsulate the salient attributes of each keypoint. This is achieved by segmenting the image into patches, from which SIFT descriptors are extracted using the widely-utilized ``opencv" Python library.% Figure \ref{Fig.3} showcases the extraction results, with keypoints highlighted in colorful circles on the images.

% \begin{figure}
% 	\centering %图片居中
% 	\includegraphics[width=0.4\textwidth]{pic_2new.png}
% 	\includegraphics[width=0.31\textwidth]{pic_4new.png}
% 	\caption{Two Examples of SIFT Keypoints.} %最终文档中希望显示的图片标题
% 	\label{Fig.3} %用于文内引用的标签
% \end{figure}

Next, we apply K-means clustering to the SIFT descriptors to create a discrete visual vocabulary, treating each cluster as a unique visual word. The optimal number of clusters (denoted by $\widetilde{K}$) is a hyperparameter in the Bag-of-Visual-Words (BOVW) model, which can be determined using various methods. Finally, an image is represented by a $\widetilde{K}$-word visual vocabulary. The distribution of these visual words forms the feature vector of the image, which can be used in MM-DTM.

Assume there are $B$ brands in the whole dataset. At time $t$ with $1\leq t\leq T$, we collect a total of $D_{b,t}$ documents for brand $b$, whose corpus is represented by $\mathbb{D}_{b,t}$. For each document $d \in \mathbb{D}_{b,t}$, it contains two kinds of information, i.e., $d=\left\{\boldsymbol{w}_{d,t}, \boldsymbol{v}_{d,t}\right\}$. Here $\boldsymbol{w}_{d,t}$ $=\left\{w^t_{d, 1}, w^t_{d, 2}, \ldots, w^t_{d, N_d}\right\}$ denote a set of textual words in document $d$ from a textual vocabulary $\mathbb{V}_w$, where $w^t_{d, i}$ is the $i^{\text {th }}$ word and $N_d$ denotes the total number of words in document $d$. Let $\boldsymbol{v}_{d,t}=\left\{v^t_{d, 1}, v^t_{d, 2}, \ldots, v^t_{d, C_d}\right\}$ denote visual words in document $d$ from a visual vocabulary $\mathbb{V}_v$, where $v^t_{d,i}$ is the $i^{\text {th }}$ visual word in the document $d$ and $C_d$ denote the total number of visual words in document $d$. For each textual word $w$, we define $U_w$ as a Bernuolli indicator to determine whether it represents a general ($U_w=1$) or brand-specific topic ($U_w=0$). Here $\rho$ is the probability of the Bernuolli distribution, which is further generated from a Beta distribution with the parameter $\gamma$. For each visual word $v$, an similar indicator $U_v$ is defined.

Assume there are two types of topics underlying the whole corpus. Specifically, there are $K_0$ general topics and $K_b$ brand-specific topics with $1\leq b \leq B$. For each general topic $1 \leq k \leq K_0$, we define $\beta^g_{k,t}$ as a $\mathbb{V}_w$-dimensional multi-normal distribution over the textual words and define $\phi^g_{k,t}$ as a $\mathbb{V}_v$-dimensional multi-normal distribution over the visual words. Similarly, for brand-specific topic $1 \leq k \leq K_b$, define $\beta^s_{k,t}$ and $\phi^s_{k,t}$ to be the textual word or visual word distribution. Furthermore, for each  document $d \in \mathbb{D}_{b,t}$, let $\theta_{d}^g$ define the document-level distribution over $K_0$ general topics and let  $\theta_{d}^s$ define the document-level distribution over $K_b$ brand-specific topics.

Based on the above notations, we give the generation process of MM-DTM as follows. The graphical representation of MM-DTM is present in Figure \ref{Fig.4}. The estimation details of MM-DTM are present in Appendix B.

\begin{figure}
	\centering %图片居中
	\includegraphics[width=0.8\textwidth]{pic_5new.png}
	\caption{The Graphical Representation of MM-DTM. {\color{magenta}}} %最终文档中希望显示的图片标题
	\label{Fig.4} %用于文内引用的标签
\end{figure}

\begin{itemize}
  \item For each general topic $k \in \{1,..., K_0\}$, generate the textual word distribution $\beta_{k, t}^g \mid \beta_{k, t-1}^g \sim N\left(\beta_{k, t-1}^g, \sigma^2 I_{w}\right)$ and the visual word distribution $\phi_{k, t}^g \mid \phi_{k, t-1}^g \sim N\left(\phi_{k, t-1}^g, \sigma^2 I_{v}\right)$, where $I_{w}$ and $I_{v}$ are identity matrices;

  \item For each brand-specific topic $k \in \{1,..., K_b\}$ with $1\leq b \leq B$, generate the textual word distribution
$\beta_{k, t}^s \mid \beta_{k, t-1}^s \sim N\left(\beta_{k, t-1}^s, \sigma^2 I_{\mathbb{V}_w}\right)$ and the visual word distribution $\phi_{k, t}^s \mid \phi_{k, t+1}^s \sim N\left(\phi_{k, t-1}^s, \sigma^2 I_{\mathbb{V}_v}\right)$;

  \item Generate the probability $\rho \sim\operatorname{Beta}(\gamma)$, which used to generate the indicator for each word representing general topics or brand-specific topics;
  \item For each brand $b \in \{1,...,B\}$ at time $t$, define $\mathbb{D}_{b,t}$ to be the corresponding document corpus. Then each  document $d \in \mathbb{D}_{b,t}$ is generated as follows:
  \begin{itemize}
  \item Generate its general topic distribution $\theta_{d}^g \sim \operatorname{Dir}(\alpha)$ and the brand-specific topic distribution $\theta_{d_b}^s \sim \operatorname{Dir}(\alpha)$;
  \item For each textual word $w$:
  \begin{itemize}
      \item Generate the indicator $U_{d,w} \sim \operatorname{Bernoulli}(\rho)$;
      \item If $U_{d_b,w}=1$, then generate the general topic $Z_{d_b,w}^g \sim \operatorname{Multi}\left(\theta_{d_b}^g\right)$. Denote $z = Z_{d_b,w}^g$ for short. Then generate $W_{d_b,w} \sim \operatorname{Multi}(\pi(\beta_{z,t}^g))$, where $\pi(\cdot)$ is the softmax transformation;
      \item If $U_{d_b,w}=0$, then generate the brand-specific topic $Z_{d_b,w}^s \sim \operatorname{Multi}\left(\theta_{d_b}^s\right)$. Denote $z = Z_{d_b,w}^s$ for short. Then generate $W_{d_b,w} \sim \operatorname{Multi}(\pi(\beta_{z,t}^s))$;
  \end{itemize}
  \item For each visual word $v$:
  \begin{itemize}
      \item Generate the indicator $U_{d_b,v} \sim \operatorname{Bernoulli}(\rho)$;
      \item If $U_{d_b,v}=1$, then generate the general topic $Z_{d_b,v}^g \sim \operatorname{Multi}\left(\theta_{d_b}^g\right)$. Denote $z = Z_{d_b,v}^g$ for short. Then generate $V_{d_b,v} \sim \operatorname{Multi}(\pi(\beta_{z,t}^g))$;
      \item If $U_{d_b,v}=0$, then generate the brand-specific topic $Z_{d_b,v}^s \sim \operatorname{Multi}\left(\theta_{d}^s\right)$. Denote $z = Z_{d_b,v}^s$ for short. Then generate $V_{d_b,v} \sim \operatorname{Multi}(\pi(\beta_{z,t}^s))$.
  \end{itemize}
  \end{itemize}
\end{itemize}


\section{Experiments}

\subsection{Data description}

In this section, we assess the efficacy of our proposed model(MMLDA and MM-DTM) using two real datasets. Initially, we delineate the dataset and detail the preprocessing steps applied to the raw data. Subsequent to this, We will introduce the comparison results with the benchmark model on metrics. The evaluation of our model's performance culminates in both quantitative and qualitative analyses, providing a comprehensive understanding of its capabilities in real applications.


We apply the MMLDA model to the ZOL mobile phone dataset \citep{xu2019multi} as the Dataset 1. Mobile phones are a significant consumer category, and consumers invest considerable time in making purchasing decisions, often leaving detailed comments on e-commerce platforms. Consequently, the opinions expressed in these online comments are rich and varied. For our analysis, we selected four well-known mobile phone brands in China based on brand characteristics and price: Huawei, Samsung, OPPO, and VIVO. According to their official websites, these brands represent two high-end innovative brands and two high cost-performance brands, each with specific product positioning. For instance, Huawei focuses on high-end innovation with strengths in mobile phone systems, while OPPO targets the youthful market and is popular among young users for its excellent design and photography features.

Consumer reviews, being unstructured information, often contain a significant amount of noise. Therefore, data preprocessing is a crucial step in review mining. Our preprocessing involved several steps. The first step was filtering, where we removed duplicate comments with the same buyer ID or identical content. Additionally, we excluded comments that contained only numbers or punctuation. The second step was word segmentation, which we performed using the ``Jieba" tool in Python. The third step was the removal of stop words, for which we used an extended version of the standard stop word list. Table~\ref{tabl:phone_brand} provides descriptive statistical information about the ZOL dataset after preprocessing.



\begin{table}[h]
	\centering
	\caption{The detailed information of four mobile phone brands.}
\footnotesize
	\begin{tabular}{cccccc}
		\hline
		\multirow{2}{*}{Brand}   & Price    & Brand      & Review & Review & Image \\
        &(rmb) &Features & Count & Length & Count\\
        \hline
		Huawei   & 4000 & Focusing on high-end innovation    & 374  & 285    & 3.67   \\
		Samsung   & 4500 & Positioning in the mid-to-high-end market & 472  & 226    & 3.81   \\
		VIVO & 2000 & High cost-performance ratio     & 324  & 312    & 3.27   \\
		OPPO & 2000 & Emphasizing appearance and photography & 358  & 241    & 4.02   \\ \hline
	\end{tabular}

	\label{tabl:phone_brand}
\end{table}


The data we use another comes from Baidu Tieba（as Dataset 2）, an independent brand under Baidu, stands as a highly popular Chinese online community platform. It is built upon search engine keywords, allowing users to precisely gather around both broad and niche topics, display their flair, connect with like-minded individuals, and construct a unique platform for ``interest-based" interaction. Spanning various fields such as society, regions, lifestyle, education, celebrity entertainment, gaming, sports, and business, Tieba is a leading Chinese communication platform where users freely exchange ideas. 



To apply the MMLDA model, we need first to generate the BoW representations for both images and texts. For textual data, we remove stop words, eliminate numbers, and filter out words whose frequencies lower than 10\%. For images, we first use the SIFT method to extract features and then apply the K-means clustering method with $\widetilde{K}=50$. Other $\widetilde{K}$ values are also considered, but the corresponding topic coherence and model perplexity metrics under the same number of topics are suboptimal.

After generating the BoW representations, we try to estimate the MMLDA model. To this end, we need to determine the general topic number \(K_0\) and specific topic number \(K_b\) for each corpus. To this end, we initially set $K_0 =1$ and $K_b=1$ for each brand (referenced as Model 1). Then we increase \(K_0\) and \(K_b\) by a stepsize of 1, with the maximum value set at 6. In total, we experiment with 15 different candidate models, and the specific number of general topics and specific topics for each model can be found in Table \ref{tabl:phone_tn} in Appendix C. During this process, we compute the model perplexity (MP) and topic coherence scores (TC) to evaluate performance of MMLDA under different topic numbers. Figure~\ref{fig:phone_tn} presents the results of model perplexity and topic coherence scores. As shown, we find the model perplexity decreases to a stable level, and the topic coherence reaches a relatively high level. As as result, the optimal selection is Model 14. Correspondingly, the optimal number of general topics is $K_0=5$ and the optimal number of specific topics for Huawei, VIVO, Samsung, and OPPO are 4, 3, 4, and 2, respectively.

\begin{figure}[htp]
	\centering
	\includegraphics[width=0.75\textwidth]{zol_index.png}
	\caption{The model perplexity (MP) and topic coherence scores (TC) during the model selection process for the ZOL data, where Model 14 is the optimal choice.}
	\label{fig:phone_tn}
\end{figure}


%\subsection{Model Comparison}

To validate the effectiveness of the MMLDA model, we compare it with the multimodal topic model \citep{shao2019personalized}. The multimodal topic model is only applicable to individual corpora and lacks the structure of general and specific topics. For a proper comparison, we first merge the multiple brand corpora and apply the multimodal topic model to the entire corpus. We then separately apply the multimodal topic model to each brand corpus. We set the number of topics for the merged corpus to 5 and the number of topics for each brand corpus to 4 (Huawei), 3 (VIVO), 4 (Samsung), and 2 (OPPO), consistent with the settings in MMLDA. We conduct a quantitative comparison between the two models using topic coherence as the metric to measure topic quality. The MMLDA model achieves better topic coherence on the entire corpus, with a score of -1.4529, while the average topic coherence of the multimodal topic model on the entire corpus is -1.4653. This comparison demonstrates that MMLDA can extract higher-quality topics compared to the single-corpus multimodal topic model.





\subsection{Analysis of Dataset 1}


The ZOL dataset consists of five general topics, each accompanied by corresponding high-frequency textual words and images, as illustrated in Table~\ref{tabl:phone_general_topic}. As shown, these images visually depict the high-frequency words associated with general topics of common interest to users across all mobile phone brands. The first topic addresses mobile operating system configurations, featuring high-frequency words such as ``operation," ``environment," ``configuration," and ``system." The associated images primarily consist of screenshots related to mobile system settings. The second topic focuses on mobile battery and configurations, including high-frequency words like ``fast charge," ``quality," and ``mAh." The corresponding images mainly feature screenshots related to system and battery settings. The third topic discusses the appearance of mobile phones, highlighting high-frequency words like ``appearance," ``large screen," and ``color." The corresponding images primarily showcase photographs capturing the aesthetics of mobile phones. The fourth topic revolves around mobile phone photography, featuring high-frequency words such as ``photography," ``effect," and ``camera." The corresponding images display photographic works uploaded by mobile phone users. The fifth topic pertains to mobile hardware configurations, encompassing high-frequency words such as ``appearance," ``large screen," and ``speaker." The corresponding images include mobile screens, desktops, and related hardware components. These five topics are crucial considerations for all brands, representing core competitive elements within the mobile phone industry.

\begin{table}[htp]
	\centering
	\caption{Results of General Topics for the ZOL Data}
	\resizebox{\linewidth}{80mm}{
	\begin{tabular}{c|ccccc}
		\hline
		\multirow{3}{*}{General Topic 1}                      & \multicolumn{5}{c}{Operation, Screen, Environment, Core, Flagship, Configuration, Purchase, System, Quality, mAh}   \\ \cline{2-6}
		& \includegraphics[width=0.18\linewidth]{phone_gt1_1.png}           & \includegraphics[width=0.18\linewidth]{phone_gt1_2.png}          & \includegraphics[width=0.18\linewidth]{phone_gt1_3.png}         & \includegraphics[width=0.18\linewidth]{phone_gt1_4.png}         & \includegraphics[width=0.18\linewidth]{phone_gt1_5.png}         \\ \hline
		\multirow{3}{*}{General Topic 2}                      & \multicolumn{5}{c}{Configuration, Fast charge, Quality, mAh, Release, NFC, Image, Suitable, Flagship, Customization} \\ \cline{2-6}
		& \includegraphics[width=0.18\linewidth]{phone_gt2_1.png}           & \includegraphics[width=0.18\linewidth]{phone_gt2_2.png}          & \includegraphics[width=0.18\linewidth]{phone_gt2_3.png}         & \includegraphics[width=0.18\linewidth]{phone_gt2_4.png}         & \includegraphics[width=0.18\linewidth]{phone_gt2_5.png}        \\ \hline
		\multirow{3}{*}{General Topic 3}                      & \multicolumn{5}{c}{Quality, Appearance, Large screen, Purchase, Placement, Image, Blur, Color}          \\ \cline{2-6}
		& \includegraphics[width=0.18\linewidth]{phone_gt3_1.png}           & \includegraphics[width=0.18\linewidth]{phone_gt3_2.png}          & \includegraphics[width=0.18\linewidth]{phone_gt3_3.png}         & \includegraphics[width=0.18\linewidth]{phone_gt3_4.png}         & \includegraphics[width=0.18\linewidth]{phone_gt3_5.png}         \\ \hline
		\multirow{3}{*}{General Topic 4}                      & \multicolumn{5}{c}{Photography, System, Design, Like, Configuration, Experience, Effect, Good, Camera, Function}  \\ \cline{2-6}
		& \includegraphics[width=0.18\linewidth]{phone_gt4_1.png}           & \includegraphics[width=0.18\linewidth]{phone_gt4_2.png}          & \includegraphics[width=0.18\linewidth]{phone_gt4_3.png}         & \includegraphics[width=0.18\linewidth]{phone_gt4_4.png}         & \includegraphics[width=0.18\linewidth]{phone_gt4_5.png}         \\ \hline
		\multicolumn{1}{l|}{\multirow{3}{*}{General Topic 5}} & \multicolumn{5}{c}{Purchase, Appearance, Image, HD, Large screen, Usage, Power consumption, Sound, Screen, Speaker}   \\ \cline{2-6}
		\multicolumn{1}{l|}{}                       & \includegraphics[width=0.18\linewidth]{phone_gt5_1.jpg}           & \includegraphics[width=0.18\linewidth]{phone_gt5_2.png}          & \includegraphics[width=0.18\linewidth]{phone_gt5_3.png}         & \includegraphics[width=0.18\linewidth]{phone_gt5_4.png}         & \includegraphics[width=0.18\linewidth]{phone_gt5_5.png}         \\ \hline
	\end{tabular}
}
	\label{tabl:phone_general_topic}
\end{table}


Next, we focus on the extracted brand-specific topics, which allow us to summarize the unique characteristics, strengths, and weaknesses of each brand. Table~\ref{tabl:huawei_specific_topic} and Table~\ref{tabl:vivo_specific_topic} show the specific topic results for brand Huawei and VIVO, from which we can summarize the unique characteristics of these two brands.

\begin{table}[htp]
	\centering
	\caption{Results of Specific Topics for Brand Huawei in the ZOL Data}
	\resizebox{\linewidth}{45mm}{
	\begin{tabular}{c|ccccc}
		\hline
		\multirow{3}{*}{Specific Topic 1}                      & \multicolumn{5}{c}{Telephone,Huawei,Run,Smoothly,Fingerprint,Function,System,Feel,Speed,Software}   \\ \cline{2-6}
		& \includegraphics[width=0.2\linewidth]{huawei_t1_1.png}           & \includegraphics[width=0.2\linewidth]{huawei_t1_2.png}          & \includegraphics[width=0.2\linewidth]{huawei_t1_3.png}         & \includegraphics[width=0.2\linewidth]{huawei_t1_4.png}             \\ \hline
		\multirow{3}{*}{Specific Topic 2}                      & \multicolumn{5}{c}{Use,Photo,Headphone,Performance,Body,Camera,Light,Battery,Design,Whole} \\ \cline{2-6}
		& \includegraphics[width=0.2\linewidth]{huawei_t2_1.png}           & \includegraphics[width=0.2\linewidth]{huawei_t2_2.png}          & \includegraphics[width=0.2\linewidth]{huawei_t2_3.png}         & \includegraphics[width=0.2\linewidth]{huawei_t2_4.jpg}        \\ \hline
		\multirow{3}{*}{Specific Topic 3}                      & \multicolumn{5}{c}{Huawei,Look,Battery,Games,Glory,System,Memory,Market,Honor of Kings,Feel}          \\ \cline{2-6}
		& \includegraphics[width=0.2\linewidth]{huawei_t3_1.png}           & \includegraphics[width=0.2\linewidth]{huawei_t3_2.png}          & \includegraphics[width=0.2\linewidth]{huawei_t3_3.png}         & \includegraphics[width=0.2\linewidth]{huawei_t3_4.png}          \\  \hline
		\multirow{3}{*}{Specific Topic 4}                      & \multicolumn{5}{c}{Support,EMUI,Series,Inch,Processor,Interface,User,Mode,Experience,Configuration}          \\ \cline{2-6}
		& \includegraphics[width=0.2\linewidth]{huawei_t3_1.png}           & \includegraphics[width=0.2\linewidth]{huawei_t3_2.png}          & \includegraphics[width=0.2\linewidth]{huawei_t3_3.png}         & \includegraphics[width=0.2\linewidth]{huawei_t3_4.png} \\ \hline
	\end{tabular}
}
	\label{tabl:huawei_specific_topic}
\end{table}


\begin{table}[htp]
	\centering
	\caption{Results of Specific Topics for Brand VIVO in the ZOL Dataset}
	\resizebox{\linewidth}{45mm}{
	\begin{tabular}{c|ccccc}
		\hline
		\multirow{3}{*}{Specific Topic 1}                      & \multicolumn{5}{c}{Quality,Function,Beauty,Camera,Aperture,Front,Unlock,Fingerprint,Flash,Promotion}   \\ \cline{2-6}
		& \includegraphics[width=0.2\linewidth]{vivo_1_1.png}           & \includegraphics[width=0.2\linewidth]{vivo_1_2.png}          & \includegraphics[width=0.2\linewidth]{vivo_1_3.png}         & \includegraphics[width=0.2\linewidth]{vivo_1_4.png}             \\ \hline
		\multirow{3}{*}{Specific Topic 2}                      & \multicolumn{5}{c}{Effect,Experience,Blurring,Photos,Focus,Sensors,Images,Light,Camera,Scene} \\ \cline{2-6}
		& \includegraphics[width=0.2\linewidth]{vivo_2_1.png}           & \includegraphics[width=0.2\linewidth]{vivo_2_2.png}          & \includegraphics[width=0.2\linewidth]{vivo_2_3.png}         & \includegraphics[width=0.2\linewidth]{vivo_2_4.png}        \\ \hline
		\multirow{3}{*}{Specific Topic 3}                      & \multicolumn{5}{c}{Telephone,Vivo,Appearance,Screen,Smooth,Feel,Like,Design,Effect,Feeling}          \\ \cline{2-6}
		& \includegraphics[width=0.2\linewidth]{vivo_3_1.png}           & \includegraphics[width=0.2\linewidth]{vivo_3_2.png}          & \includegraphics[width=0.2\linewidth]{vivo_3_3.png}         & \includegraphics[width=0.2\linewidth]{vivo_3_4.png}          \\ \hline
	\end{tabular}
}
	\label{tabl:vivo_specific_topic}
\end{table}

\textbf{Huawei}: Focusing on System Usage Experience. Among the four specific brand topics in the Huawei corpus, three pertain to system configurations, with high-frequency terms such as ``processor," ``interface," and ``configuration." Users of this brand are particularly concerned with the mobile phone system's usage experience, frequently discussing the operational ``speed" and the smoothness of games like ``King of Glory."

\textbf{VIVO}: Emphasis on Appearance and Exceptional Photography Features. VIVO phones are lauded for their excellent photography capabilities. One specific topic is closely related to photography, with users focusing on functions like ``blurring," ``focus," and ``aperture," and using the camera to capture ``scene." The images associated with this topic include exquisite photos uploaded by users, such as city nightscapes and beach sunsets. VIVO users also value the phone's appearance, with one topic highlighting ``appearance," ``screen," and ``design."

For the other two brands, Samsung and OPPO, we can summarize their brand features as follows:

\textbf{Samsung}: Rich Features and Innovative Design. The brand topics for Samsung phones are relatively diverse. One topic centers on the mobile phone's camera capabilities, mentioning not only basic ``photography" and ``effects" but also advanced features such as ``stabilization," ``optical," and ``focus." Another topic emphasizes unique functions like ``curved" screens and the ``feel" of the phone, while another discusses ``fingerprint" and ``iris" functions, indicating that Samsung users are more interested in advanced features and innovative designs.

\textbf{OPPO}: Smooth System and Excellent Selfie Features. High-frequency words like ``front," ``beauty," and ``natural" indicate that OPPO phones' selfie capabilities are highly appreciated by users, with corresponding images primarily being selfies. Additionally, the ``smooth" user experience is well-regarded by consumers, and various features reflect the high cost-effectiveness of this brand.

Based on these findings, MMLDA can also identify potential competitors for brands. For instance, in Huawei's specific brand topics, ``Apple" appears as a high-frequency word. As a brand similarly focused on high-end technological innovation, users often compare Huawei to Apple, offering valuable insights for product upgrades and improvements. Furthermore, MMLDA can identify potential customer segments to enhance user retention. For example, OPPO's widely recognized selfie and beauty features reveal a potential user group focused on photography and personal appearance. By catering to the needs of this group when developing new features and upgrading products, brands can significantly boost user loyalty.




\subsection{Analysis of Dataset 2}

To evaluate the performance of MM-DTM, we compare the proposed model with two carefully selected alternative baselines.

Baseline 1: LDA, the Latent Dirichlet Allocation (LDA) model, stands as a seminal approach in the realm of topic discovery. In our analysis, we deploy the standard LDA model to delineate topics from the textual descriptions within our dataset.

Baseline 2: DTM, the Dynamic Topic Model (DTM), serves as a pivotal advancement in the analysis of temporal topic evolution, expanding upon the foundational principles of the Latent Dirichlet Allocation (LDA) model to capture changes in topics over time. In our study, we harness the DTM to meticulously trace the thematic progression within our dataset's textual narratives across distinct time frames.

The primary goal of this research is to discern topics within a dataset that encompasses both text and images, utilizing probabilistic topic modeling techniques. To ascertain the quality and coherence of the topics extracted through this modeling approach, we introduce three specific metrics. These metrics are strategically chosen to provide a multifaceted evaluation of the model's performance.


Metric 1: Perplexity, perplexity is a widely used metric in the field of Natural Language Processing (NLP) for evaluating the quality of language models. It primarily estimates the probability of a sentence occurring, based on the likelihood of each word within that sentence, and normalizes this by the length of the sentence. The calculation formula for perplexity is:
$$
P P(S)=2^{-\frac{1}{N} \sum \log \left(P\left(w_i\right)\right)}
$$
Better topic quality is indicated by a higher value of $P\left(w_i\right)$, leads to a lower value of perplexity.


Metric 2: PMI, Point Mutual Information (PMI) is a measure of association used in information theory and statistics, designed to quantify the relevance and coherence of words within a given topic. The calculation formula for perplexity is:
$$
\operatorname{PMI}(Z)=\frac{2}{N(N-1)} \sum_{1 \leq i<j \leq N} \log \frac{D\left(w_i, w_j\right)}{D\left(w_i\right) D\left(w_j\right)}
$$
The calculation of PMI involves assessing the co-occurrence frequency of word pairs within the same documents. Specifically, for a given topic $Z$ and the top $N$ words associated with $Z$, let aa denote the number of documents in which two words appear together, while bb and cc represent the number of documents each word appears in, respectively. The PMI value, which increases with the co-occurrence frequency of word pairs, reflects the coherence of words within a topic. Higher PMI values indicate that the topic's words are more likely to appear together in the same document, suggesting a more coherent and meaningful topic, so better topic quality is indicated by a higher value of PMI. Averaging the PMI scores across all topics provides a metric for comparing the effectiveness of different topic modeling approaches.

Metric 3: Coherence, Coherence score is an indicator used to measure the interpretability of topics, assessing the degree of similarity between high-probability words within a word distribution. Its calculation formula is as follows:
$$
C\left(Z ; S^z\right)=\sum_{n=2}^N \sum_{l=1}^{n-1} \log \frac{D_2\left(w_n^z, w_l^z\right)+1}{D_1\left(w_l^z\right)}
$$
For a given topic \(Z\) and the set of top \(N\) high-probability words in \(Z\)'s distribution \(S^z= \left\{w_1^z, \ldots, w_N^z\right\}\), \(D_1(w_l^z)\) represents the document frequency of word \(w_l^z\), and \(D_2(w_n^z, w_l^z)\) is the co-document frequency of the word pair \(w_n^z, w_l^z\). A higher coherence score indicates better interpretability of the topic, meaning the topic's word distribution is more meaningful and semantically coherent. By calculating the Coherence score for the word distributions of all topic models and summing them up, it can serve as a metric for evaluating the quality of model topics; the higher the score, the better the model.

To process images from the two datasets, we follow the procedure outlined in Section 3.2.1, converting them into collections of visual words. These processed visual words are then combined with textual words to form a unified corpus. Upon this combined corpus, we run both the Multimodal Multiple-corpora Dynamic Topic Model (MM-DTM) and the Dynamic Topic Model (DTM), as well as the Latent Dirichlet Allocation (LDA) model for comparative analysis.

For each dataset, the models are executed three times to ensure robustness and reliability of the results. The average values of the metrics are calculated across these iterations and are used for comparative analysis. By averaging the metrics, we ensure that the comparison between MM-DTM, DTM, and LDA models is fair and reflective of their true performance across different datasets.


Dataset 2 is derived from the ``Oppo Bar" and ``Huawei Bar" within Baidu Tieba where ``Bar" means a subset of Baidu Tieba, focusing on these well-known smartphone brands. It encompasses various discussions related to these brands, such as advantages and disadvantages of the phones, user experiences, and after-sales services. Posts from January to February across 2022, 2023, and 2024 were collected. Given the detailed content provided by the original posters (OPs) compared to the more sparse and varied responses, only the OPs' posts were harvested, excluding responses. The posts often include images corresponding to the content, thus meeting the multimodal, multiple corpora, and temporal dynamics criteria required by the MM-DTM. The total number of documents crawled by OPPO bar is 1854, and the number of documents crawled by Huawei bar is 1827.

The hyperparameter values of MM-DTM on dataset 1 are as follows: we apply 4 general topics, 3 specific topics and set the number of visual words to 300.

The comparison of metrics with the benchmark model is shown in Figure 5.The larger the area in the image, the better the model effect.

\begin{figure}
	\centering %图片居中
	\includegraphics[width=0.7\textwidth]{data1.png}
	\caption{Metrics comparision on dataset 1} %最终文档中希望显示的图片标题
	\label{Fig.5} %用于文内引用的标签
\end{figure}

The output of MM-DTM on dataset 1, regarding the general and specific topics across different time points are as follows.

\begin{itemize}
  \item {\sc Results of general topics.}
\end{itemize}


% general of dataset 1
\begin{table}
	\centering
\footnotesize
	\begin{tabular}{|m{1.2cm}<{\centering}|m{1.2cm}<{\centering}|m{10.5cm}|}
		\hline
		\multirow{12}{0.1\textwidth}{\centering Time 1 general topic} & \multirow{5}*{Topic 1} & Service, user, system, global, experience, intelligence, release, enhancement, series, technology, imaging, industry, chip, design, screen, brand, one \\
		\cline{3-3}
		~ & ~ & \vspace{1.5mm} \includegraphics[width=2.5cm,height=2cm]{1ge_11.png} \includegraphics[width=2.5cm,height=2cm]{1ge_12.png} \includegraphics[width=2.5cm,height=2cm]{1ge_13.png} \includegraphics[width=2.5cm,height=2cm]{1ge_14.png} \\
		\cline{2-3}
		~ & \multirow{5}*{Topic 2} & Series, tablet, release, month, phone, product, day, model, new, computer, new product, version, look, official, product, update, settings \\
		\cline{3-3}
		~ & ~ & \vspace{1.5mm} \includegraphics[width=2.5cm,height=2cm]{1ge_21.png} \includegraphics[width=2.5cm,height=2cm]{1ge_22.png} \includegraphics[width=2.5cm,height=2cm]{1ge_23.png} \includegraphics[width=2.5cm,height=2cm]{1ge_24.png} \\
		
		\hline
		\multirow{12}{0.1\textwidth}{\centering Time 2 general topic} & \multirow{5}*{Topic 1} & Phone, system, smoothness, memory, update, video, settings, update, data, upgrade, experience, version \\
		\cline{3-3}
		~ & ~ & \vspace{1.5mm} \includegraphics[width=2.5cm,height=2cm]{1ge_31.png} \includegraphics[width=2.5cm,height=2cm]{1ge_32.png} \includegraphics[width=2.5cm,height=2cm]{1ge_33.png} \includegraphics[width=2.5cm,height=2cm]{1ge_34.png} \\
		\cline{2-3}
		~ & \multirow{5}*{Topic 2} & Phone, screen, experience, hover, product, hinge, design, body, user, bring, image, sound quality, chip, processor \\
		\cline{3-3}
		~ & ~ & \vspace{1.5mm} \includegraphics[width=2.5cm,height=2cm]{1ge_41.png} \includegraphics[width=2.5cm,height=2cm]{1ge_42.png} \includegraphics[width=2.5cm,height=2cm]{1ge_43.png} \includegraphics[width=2.5cm,height=2cm]{1ge_44.png} \\
		
		\hline
		\multirow{12}{0.1\textwidth}{\centering Time 3 general topic} & \multirow{5}*{Topic 1} & Adopting, supporting, designing, performance, carrying, screen, pixel, million, chip, lens, technology, shooting, taking photos, imaging, battery, charging \\
		\cline{3-3}
		~ & ~ & \vspace{1.5mm} \includegraphics[width=2.5cm,height=2cm]{1ge_51.png} \includegraphics[width=2.5cm,height=2cm]{1ge_52.png} \includegraphics[width=2.5cm,height=2cm]{1ge_53.png} \includegraphics[width=2.5cm,height=2cm]{1ge_54.png} \\
		\cline{2-3}
		~ & \multirow{5}*{Topic 2} & Phone, display, settings, updates, purchases, photos, versions, systems, devices, games, help, availability, replacement, battery life \\
		\cline{3-3}
		~ & ~ & \vspace{1.5mm} \includegraphics[width=2.5cm,height=2cm]{1ge_61.png} \includegraphics[width=2.5cm,height=2cm]{1ge_62.png} \includegraphics[width=2.5cm,height=2cm]{1ge_63.png} \includegraphics[width=2.5cm,height=2cm]{1ge_64.png} \\
		\hline
		
	\end{tabular}
	\caption{The results of general topics of different phone brands.}
\end{table}

At time point 1, Topic 1 delves into the functionalities and technologies of smartphones, covering various aspects of phone design and showcasing the wide applications of smartphones in daily life. The images correspondingly depict the multifarious uses of smartphones, illustrating how both brands have significantly facilitated our lives. Topic 2 focuses on the launch of new models and systems, with terminology frequently hinting at updates and innovations. The images, predominantly of new models and systems, indicate both brands' continuous efforts to renew and appeal to consumers.

At time point 2, Topic 1 centers on system updates and the user experience of smartphones, with terms like smoothness, memory, and video highlighting these aspects. The images mainly showcase various functionalities and evaluations during use, suggesting extensive discussions by both brands on enhancing user comfort and experience. Topic 2 zooms in on the hardware and aesthetics of phones, discussing screen, body, design, and processor. The corresponding images reflect these discussions, showing that users from both brands place high importance on the hardware and design, expressing their opinions on these features.

At time point 3, Topic 1 focuses on photography capabilities and battery charging, a period during which both brands introduced distinctive features in their smartphones, such as high resolution, proprietary lenses, and unique photography functions, serving as selling points. The related images also highlight these aspects. Moreover, charging technologies are discussed, as both brands launched their super-fast charging capabilities, significantly increasing charging speed and sparking user interest. Topic 2 involves discussions on the operating system, with both brands having updated their systems—Huawei with HarmonyOS and OPPO with ColorOS—introducing new features. Users discuss their experiences with these updated systems, including gaming, photography, and battery life, with images often showing screenshots of the system functions.


\begin{itemize}
  \item {\sc Results of specific topics of Huawei.}
\end{itemize}

\begin{table}
	\centering
\footnotesize
	\begin{tabular}{|m{1.2cm}<{\centering}|m{1.2cm}<{\centering}|m{10.5cm}|}
		\hline
		\multirow{12}{0.1\textwidth}{\centering Time 1 specific topic} & \multirow{5}*{Topic 1} & Huawei, mobile phone, HarmonyOS, smart, picture, new, Mate40, complete, upgraded, displayed, updated, Harmony \\
		\cline{3-3}
		~ & ~ & \vspace{1.5mm} \includegraphics[width=2.5cm,height=2cm]{1huawei_11.png} \includegraphics[width=2.5cm,height=2cm]{1huawei_12.png} \includegraphics[width=2.5cm,height=2cm]{1huawei_13.png} \includegraphics[width=2.5cm,height=2cm]{1huawei_14.png} \\
		\cline{2-3}
		~ & \multirow{5}*{Topic 2} & Screens, Kirin, chips, Hua-fans, activities, applications, patents, enterprises, appearances, news, equipment, registration, international, devices, motherboards, automobiles \\
		\cline{3-3}
		~ & ~ & \vspace{1.5mm} \includegraphics[width=2cm,height=2cm]{1huawei_21.png} \includegraphics[width=2cm,height=2cm]{1huawei_22.png} \includegraphics[width=2cm,height=2cm]{1huawei_23.png} \includegraphics[width=2cm,height=2cm]{1huawei_24.png}
		\includegraphics[width=2cm,height=2cm]{1huawei_25.png} \\
		
		\hline
		\multirow{12}{0.1\textwidth}{\centering Time 2 specific topic} & \multirow{5}*{Topic 1} & Huawei, mobile phone, P50, seek for help, buy, suggest, think, Apple, Samsung, good, glory, recommend, tablet, screen \\
		\cline{3-3}
		~ & ~ & \vspace{1.5mm} \includegraphics[width=2cm,height=2cm]{1huawei_31.png} \includegraphics[width=2cm,height=2cm]{1huawei_32.png} \includegraphics[width=2cm,height=2cm]{1huawei_33.png} \includegraphics[width=2cm,height=2cm]{1huawei_34.png}
		\includegraphics[width=2cm,height=2cm]{1huawei_35.png} \\
		\cline{2-3}
		~ & \multirow{5}*{Topic 2} & HarmonyOS, features, system, security patch, version, time, P50, recommendations, view \\
		\cline{3-3}
		~ & ~ & \vspace{1.5mm} \includegraphics[width=2cm,height=2cm]{1huawei_41.png} \includegraphics[width=2cm,height=2cm]{1huawei_42.png} \includegraphics[width=2cm,height=2cm]{1huawei_43.png} \includegraphics[width=2cm,height=2cm]{1huawei_44.png}
		\includegraphics[width=2cm,height=2cm]{1huawei_45.png} \\
		
		\hline
		\multirow{12}{0.1\textwidth}{\centering Time 3 specific topic} & \multirow{5}*{Topic 1} & Huawei, mobile phone, Mate60, Kirin, chip, good, design, Team-buy, buy, screen, tablet, far ahead, purchase, imaging \\
		\cline{3-3}
		~ & ~ & \vspace{1.5mm} \includegraphics[width=2cm,height=2cm]{1huawei_51.png} \includegraphics[width=2cm,height=2cm]{1huawei_52.png} \includegraphics[width=2cm,height=2cm]{1huawei_53.png} \includegraphics[width=2cm,height=2cm]{1huawei_54.png}
		\includegraphics[width=2cm,height=2cm]{1huawei_55.png} \\
		\cline{2-3}
		~ & \multirow{5}*{Topic 2} & Huawei, HarmonyOS, system, restart, Apple, startup, WeChat, display, monthly, Xiaomi, games, after sales \\
		\cline{3-3}
		~ & ~ & \vspace{1.5mm} \includegraphics[width=1.6cm,height=2cm]{1huawei_61.png} \includegraphics[width=1.6cm,height=2cm]{1huawei_62.png} \includegraphics[width=1.6cm,height=2cm]{1huawei_63.png} \includegraphics[width=1.6cm,height=2cm]{1huawei_64.png}
		\includegraphics[width=1.6cm,height=2cm]{1huawei_65.png}
		\includegraphics[width=1.6cm,height=2cm]{1huawei_66.png} \\
		\hline
		
	\end{tabular}
	\caption{The results of brand-specific topics of Huawei}
\end{table}


At time point 1, Topic 1 centers on the HarmonyOS and the then-popular model ``Mate40," with recent developments including the third batch of HarmonyOS going open source, which added a plethora of components and sparked significant discussion. The images associated with Topic 1 correspondingly highlight the promotion and upgrades of the HarmonyOS. Topic 2 addresses issues related to the self-development, patent registration, and technology embargo of Huawei's hardware, such as chips and motherboards, with images displaying information on chips and motherboards. This topic also covers a series of events launched by Huawei at the time, including cloud-native and Vision advertisements, reflecting hot topics of discussion.

At time point 2, Topic 1 shifts to queries about the new ``P50" model's value compared to brands like Apple and Samsung, mainly focusing on ``5G." Due to the P50 model's lack of 5G support, many users were still hesitating and comparing. Some users shared images of phone cases that could enable 5G functionality, highlighting 5G as a significant shortcoming of the P50 phone. Topic 2 delves into discussions about the HarmonyOS on the P50, including updates to system functions, security patches, and system displays. Images largely consist of screenshots post-system update and issues encountered during updates, indicating areas where HarmonyOS updates were lacking, thus prompting community discussions.

At time point 3, Topic 1 zooms in on the recently released ``Mate60," focusing on its new Kirin chipset. The device is lauded as ``far ahead" in discussions about ``Team-buy" and ``purchase" with images predominantly featuring the Kirin chipset and phone purchases, demonstrating consumer approval of the model. Topic 2 continues to explore HarmonyOS and after-sales service issues. Since its launch, HarmonyOS has been continually updated, with discussions evolving around the update content. Some users encountered problems during system updates, like activation issues shown in images, while others were satisfied with the new system features, sharing their favorites. Additionally, some customers expressed dissatisfaction with Huawei's after-sales service.

\begin{itemize}
  \item {\sc Results of specific topics of OPPO.}
\end{itemize}

%specific topic of oppo
\begin{table}
	\centering
\footnotesize
	\begin{tabular}{|m{1.2cm}<{\centering}|m{1.2cm}<{\centering}|m{10.5cm}|}
		\hline
		\multirow{12}{0.1\textwidth}{\centering Time 1 specific topic} & \multirow{5}*{Topic 1} & Series, adopte, Snapdragon, tablet, equipped with, Dimensity, support, body, flagship, lens, design, chip, performance, processor, imaging, Mariana, self-developed \\
		\cline{3-3}
		~ & ~ & \vspace{1.5mm} \includegraphics[width=2.5cm,height=2cm]{1oppo_11.png} \includegraphics[width=2.5cm,height=2cm]{1oppo_12.png} \includegraphics[width=2.5cm,height=2cm]{1oppo_13.png} \includegraphics[width=2.5cm,height=2cm]{1oppo_14.png} \\
		\cline{2-3}
		~ & \multirow{5}*{Topic 2} & Phone, experience, features, users, folding, screen, games, products, screen, smooth, system, bring, hinges, operations, sound quality \\
		\cline{3-3}
		~ & ~ & \vspace{1.5mm} \includegraphics[width=2.5cm,height=2cm]{1oppo_21.png} \includegraphics[width=2.5cm,height=2cm]{1oppo_22.png} \includegraphics[width=2.5cm,height=2cm]{1oppo_23.png} \includegraphics[width=2.5cm,height=2cm]{1oppo_24.png} \\
		
		\hline
		\multirow{12}{0.1\textwidth}{\centering Time 2 specific topic} & \multirow{5}*{Topic 1} & Customized, red, year of the rabbit, new year, health, smart, gift box, technology, watch, co-branded, rabbit, mariana, official edition, sales \\
		\cline{3-3}
		~ & ~ & \vspace{1.5mm} \includegraphics[width=2.5cm,height=2cm]{1oppo_31.png} \includegraphics[width=2.5cm,height=2cm]{1oppo_32.png} \includegraphics[width=2.5cm,height=2cm]{1oppo_33.png} \includegraphics[width=2.5cm,height=2cm]{1oppo_34.png} \\
		\cline{2-3}
		~ & \multirow{5}*{Topic 2} & Folding, series, screen, experience, user, function, support, bring, external screen, imaging, flagship, inch, using \\
		\cline{3-3}
		~ & ~ & \vspace{1.5mm} \includegraphics[width=2.5cm,height=2cm]{1oppo_41.png} \includegraphics[width=2.5cm,height=2cm]{1oppo_42.png} \includegraphics[width=2.5cm,height=2cm]{1oppo_43.png} \includegraphics[width=2.5cm,height=2cm]{1oppo_44.png} \\
		
		\hline
		\multirow{12}{0.1\textwidth}{\centering Time 3 specific topic} & \multirow{5}*{Topic 1} & Mobile phone, OnePlus, price, screen, configuration, performance, cost-effectiveness, high, yuan, performance, gaming, real, Snapdragon, imaging, battery life, design \\
		\cline{3-3}
		~ & ~ & \vspace{1.5mm} \includegraphics[width=2.5cm,height=2cm]{1oppo_51.png} \includegraphics[width=2.5cm,height=2cm]{1oppo_52.png} \includegraphics[width=2.5cm,height=2cm]{1oppo_53.png} \includegraphics[width=2.5cm,height=2cm]{1oppo_54.png} \\
		\cline{2-3}
		~ & \multirow{5}*{Topic 2} & Consultation, series, elimination, Oppo, phone, new, gift box, update, system, upgrade, OPPO, replace \\
		\cline{3-3}
		~ & ~ & \vspace{1.5mm} \includegraphics[width=2cm,height=2cm]{1oppo_61.png} \includegraphics[width=2cm,height=2cm]{1oppo_62.png} \includegraphics[width=2cm,height=2cm]{1oppo_63.png} \includegraphics[width=2cm,height=2cm]{1oppo_64.png}
		\includegraphics[width=2cm,height=2cm]{1oppo_65.png} \\
		\hline
		
	\end{tabular}
	\caption{The results of brand-specific topics of OPPO}
\end{table}

From a temporal perspective, at time point 1, Topic 1 involves discussions about the hardware of OPPO phones, such as Snapdragon and Mariana self-developed chips, Dimensity mobile platforms, lenses, processors, and more. The corresponding images primarily feature the hardware components used in OPPO phones, indicating users had many questions about OPPO's hardware, leading to lively discussions on Tieba. Topic 2 focuses on discussions about the user experience with phones, touching on features, smoothness, sound quality, gaming, and other aspects that reflect the real user experience. The images for this topic are largely about various phone evaluations and user experiences, including professional audio quality tests and demonstrations of gaming fluidity. Discussions also covered the user experience and product features of OPPO's foldable phones at the time.

At time point 2, Topic 1 is clearly centered on the special red gift box designed for the Year of the Rabbit, with images showing the gift box's predominantly red theme, symbolizing a prosperous new year. This edition received widespread approval from users. Discussions within Topic 1 also touched upon OPPO's new smartwatch models. Topic 2's content primarily revolves around foldable phones, discussing their user experience, imaging capabilities, size, and more, with corresponding images illustrating these aspects, such as camera photo quality, size comparisons, and the phones' exterior designs. This indicates users were still exploring and discussing foldable phones.

At time point 3, Topic 1 is about the performance of OPPO phones, covering aspects like cost-effectiveness, configuration, price, screen, gaming, battery life, and more. Around this time, another smartphone brand, OnePlus, announced the merger of its operating system with OPPO's, leading to extensive discussions. Images related to this topic often depict the design and appearance of the phones, showing that consumers on Tieba engaged in detailed discussions about OPPO's strengths and weaknesses, providing a comprehensive analysis. Topic 2 centers on discussions about system updates for OPPO phones, whether to upgrade the system, and the various features that come with new systems. Images frequently show screenshots of the new system and discussions about new models, including purchasing new models and data migration for new devices.

\begin{itemize}
  \item {\sc Brands comparison.}
\end{itemize}



From a brand perspective, there are significant differences in the thematic content of discussions about Huawei and OPPO.

i. Huawei discussions primarily focus on the Kirin chip, self-developed patents, the HarmonyOS, and various popular models like the P50 and Mate60 over different periods. Given that the HarmonyOS is a proprietary system continuously undergoing updates and iterations, discussions around it are fervent, with conversations about its new features, bugs, and user experience emerging at every time point. Additionally, discussions extend to Huawei's various sales activities and comparisons between Huawei and other brands, such as Apple. The constant updates and the proprietary nature of the HarmonyOS spark lively debates and discussions about its evolution and impact on user experience.

ii. OPPO discussions center around its self-developed chips, cost-effectiveness of its phones, user experience, and various sales activities. A notable difference from Huawei is the lack of extensive discussions about the operating system; OPPO's ColorOS appears to be more stable, not generating as much concern or discussion among users. The cost-performance ratio of OPPO phones is a hot topic among users who compare its Mariana chip with others like Snapdragon, delving into the phones' performance and value for money. This indicates that OPPO distinguishes itself with more competitively priced offerings, as discussions about cost-effectiveness are seldom seen with Huawei phones.

These observations underscore the unique positions Huawei and OPPO occupy in the consumer discourse, with Huawei being associated with cutting-edge technology and continuous innovation in its operating system, and OPPO being recognized for its value for money and stable operating system, highlighting differing consumer perceptions and priorities regarding these two prominent brands.


\begin{itemize}
  \item {\sc Brands comparison.}
\end{itemize}

From a brand perspective, there are clear differences in the thematic content discussed for the two games, Valorant and Overwatch.

i.Discussions within the Valorant community have a heavier focus on in-game skin sales. Players showcase the items available in their game store refreshes on Tieba, seeking opinions from the community, and some players provide reviews of the skins, offering advice to those still deciding whether to purchase. Additionally, there's more content related to gameplay strategies in Valorant, as the game was newly available in China in August 2023. This influx of new players attracted experienced players to post guides and gameplay experiences to help newcomers quickly acclimate. Sharing strategies for offense and defense, along with how to best use game items, became a hot topic among players.

ii.The most notable aspect of Overwatch at this time was the surge of negative reviews on Steam upon its launch, rapidly elevating it to the top of the negative review rankings—a shocking event in gaming history. This incident became a popular topic among players, highlighting their collective frustration. However, as time progressed, some players began to move past their initial anger, focusing instead on discussing methods for logging into the game and updates to the game version, aiming to enjoy the entertainment the game offers.

\section{Conclusion and Discussion}


This study proposes two models—MMLDA and MM-DTM to advance multi-brand competitive analysis using multimodal data. MMLDA enables static comparison across brands by integrating textual and visual reviews to uncover both shared and brand-specific topics. MM-DTM extends this by modeling topic evolution over time, capturing temporal trends in brand perception. These models provide practical insights for product positioning, marketing strategy, and consumer sentiment tracking. However, challenges remain in parameter sensitivity, computational efficiency, and topic interpretability—particularly for visual features. Future research may focus on improving interpretability, handling multilingual and real-time data, and integrating additional modalities such as video and audio. Together, these models offer a comprehensive framework for understanding brand dynamics in today’s rich and evolving digital landscape.


\section*{Acknowledgement}
This research is supported by National Natural Science Foundation of China (72371241, 72171229), and the MOE Project of Key Research Institute of Humanities and Social Sciences (22JJD110001).




\newpage

\bibliographystyle{asa}
\bibliography{all}



\newpage


\section*{Appendix A: Model Estimation of MMLDA}

\renewcommand\theequation{A.\arabic{equation}}
\setcounter{table}{0}
\setcounter{figure}{0}
\renewcommand{\thetable}{A.\arabic{table}}
\renewcommand{\thefigure}{A.\arabic{figure}}


We employ the Gibbs sampling method \citep{hastings1970monte} for estimation of MMLDA. Let $\boldsymbol{\Theta^g}$ and $\boldsymbol{\Theta^s}$ represent the collection of document-topic distributions over general topics and specific topics, respectively. Let $\boldsymbol{\Phi^ {T,g}}$, $\boldsymbol{\Phi^ {I,g}}$, $\boldsymbol{\Phi^ {T,s}}$, and $\boldsymbol{\Phi^ {I,s}}$ represent the collection of word distributions of general topics and specific topics over textual vocabulary and visual vocabulary, respectively. Let $\boldsymbol{w}$ represent the all the observed texutal words and image visual words in the corpora, and $\boldsymbol{u}$, $\boldsymbol{z}$ represent the corresponding indicator variables. Given the observed data $\boldsymbol{w}$ and all hyperparameters ($\beta,\beta_b,\alpha_g,\alpha_s,\gamma$), we first derive the complete posterior distribution according to the generative process of MMLDA.


\begin{equation}
\begin{split}
    &P(\mathbf{z}^s, \mathbf{z}^g, \mathbf{u}, \theta^s, \theta^g, \phi^{T,s}, \phi^{I,s}, \phi^{T,g}, \phi^{I,g}, P | \alpha, \beta, \gamma)  \propto \\
    &\Big[ \prod_{b=1}^{B} \prod_{d=1}^{D_b} \prod_{k=1}^{K} (\theta_{dk}^G)^{\alpha-1} \Big]
    \Big[ \prod_{b=1}^{B} \prod_{d=1}^{D_b} \prod_{k=1}^{K_b} (\theta_{dk}^S)^{\alpha-1} \Big]
    \Big[\prod_{k=1}^{K} \prod_{\v=1}^{V^T} (\phi_{v k}^{T,g})^{\beta-1} \Big] \Big[\prod_{k=1}^{K} \prod_{v=1}^{V^I} (\phi_{v k}^{I,g})^{\beta-1} \Big] \\
    &\Big[ \prod_{b}^B \prod_{k=1}^{K_b} \prod_{v=1}^{V_b^T} (\phi_{vk}^{T,s})^{\beta-1} \Big] \Big[ \prod_{b}^B \prod_{k=1}^{K_b} \prod_{v=1}^{V_b^I} (\phi_{vk}^{I,s})^{\beta-1} \Big]
    \Big[ \prod_{b=1}^{B} \prod_{d=1}^{D_b}  \prod_{w=1}^{W_d^T} p_{bdw,t} ^{\gamma-1} (1 - p_{bdw,t})^{\gamma-1} \Big] \\
    &
    \Big[ \prod_{b=1}^{B} \prod_{d=1}^{D_b} \prod_{w=1}^{W_d^T}  \text{Beta}(\gamma) p_{bdw,t}^{u_{d_b,w}^T} (1 - p_{bdw,t}) \Big]
    \Big[\prod_{b=1}^{B} \prod_{d=1}^{D_b} \prod_{w=1}^{W_d^I}  \text{Beta}(\gamma) p_{bdw,i}^{u_{d_b,w}^I} (1 - p_{bdw,i}) \Big] \\
    &\Big[ \prod_{b=1}^{B} \prod_{d=1}^{D_b}  \prod_{w=1}^{W_d^I} p_{bdw,i} ^{\gamma-1} (1 - p_{bdw,i})^{\gamma-1} \Big]
    \Big[ \prod_{b=1}^{B} \prod_{d=1}^{D_b} \prod_{w=1}^{W_d^T} ( \phi_{ z_{d_b,w,g}^{T,g}})^{I(u_{d_b,w}^T = 0)} \Big]\\
    &\Big[\prod_{b=1}^{B} \prod_{d=1}^{D_b} \prod_{w=1}^{W_d^T} ( \phi_{ z_{d_b,w,s}^{T,s}})^{I(u_{d_b,w}^T = 1)} \Big]
    \Big[ \prod_{b=1}^{B} \prod_{d=1}^{D_b} \prod_{w=1}^{W_d^I} ( \phi_{ z_{d_b,w,g}^{I,g}})^{I(u_{d_b,w}^I = 0)} \Big]\\
    &\Big[ \prod_{b=1}^{B} \prod_{d=1}^{D_b} \prod_{w=1}^{W_d^I} ( \phi_{ z_{d_b,w,s}^{I,s}})^{I(u_{d_b,w}^I = 1)} \Big]
    %\fi
\end{split}
\end{equation}


Based on the above posterior distribution, we obtain the following conditional distributions. Iteratively sampling from these conditional distributions until convergence yields the final estimation. Below, we present the conditional distributions for textual information. The conditional distributions for image information are similar and thus omitted.

First, for the textual word $n$ in document $d$ of corpus $b$, given the values of all other latent variables, the conditional distribution of the general topic indicator $z_{d_b,n}^g$ is:

\begin{align}
	\begin{split}
		P(z_{{d_b},n}^g=k|\boldsymbol{z}^g_{\neg ({d_b},n)},\boldsymbol{u},\boldsymbol{w}) \propto \frac{c^{d_b,g}_{(k)}+\alpha}{c_{(.)}^{d_b,g}+K_0 \alpha} \times \frac{c_{(v)}^{g,k}+ \beta}{c_{(.)}^{g,k}+ V^T \beta}  \\
	\end{split}
\end{align}
Here, $c^{d_b,g}{(k)}$ is the count of textual words assigned to topic $k$ in document $d_b$, and $c^{d_b,g}{(.)}$ is the total count of textual words in document $d_b$; $c^{g,k}{(v)}$ is the count of textual word $v$ assigned to topic $k$, and $c^{g,k}{(.)}$ is the total count of any textual word assigned to topic $k$. $\boldsymbol{z}^g_{\neg ({d_b},n)}$ denotes the collection of $\boldsymbol{z}^g$ excluding $z_{{d_b},n}^g$. All counts denoted by $c$ do not include the $n$ word in document $d$.

Second, the conditional distribution for the specific textual topic indicator $z_{d_b,s}^s$ and image topic indicator $z_{d_b,s}^s$ is given by the following equation. The notation is similar to the above, with the only difference being the superscript $s$ indicating specific words and the superscript $b$ indicating that the counts are restricted to corpus $b$.
\begin{align}
	\begin{split}
		P(z_{{d_b},n}^s=k|\boldsymbol{z}^s_{\neg ({d_b},n)},\boldsymbol{u},\boldsymbol{w}) \propto \frac{c^{d_b,s}_{(k)}+\alpha}{c_{(.)}^{d_b,s}+K_b \alpha} \times \frac{c_{(v)}^{s,k,b}+ \beta}{c_{(.)}^{s,k,b}+ V_b^T \beta}  \\
	\end{split}
\end{align}



Third, the conditional probabilities of the indicator variables $u_{{d_b},n}^T$ and $u_{{d_b},n}^I$ are derived as follows,
\begin{equation}
	P(u_{{d_b},n}^l =b|\boldsymbol{z},\boldsymbol{u}_{\neg ({d_b},n)}, \boldsymbol{w}) \\
	\propto \left \{
	\begin{array}{ll}
		\frac{c_{(0)}^T+\gamma}{c_{(.)}^T+2 \gamma}   & \text{if } l=\text{T}, b=0  \\
		\frac{c_{(0)}^I+\gamma}{c_{(.)}^I+2 \gamma}   & \text{if } l=\text{I}, b=0  \\
		\frac{c_{(1)}^T+\gamma}{c_{(.)}^T+2 \gamma}   & \text{if } l=\text{T}, b=1  \\
		\frac{c_{(1)}^I+\gamma}{c_{(.)}^I+2 \gamma}   & \text{if } l=\text{I}, b=1  \\
	\end{array}
	\right.
\end{equation}
Here $c_{(0)}^T$ represents the count of textual words belonging to specific topics, $c_{(1)}^T$ represents the count of textual words belonging to general topics, and $c_{(.)}^T$ represents the total count of textual words. The corresponding values with the superscript $I$ have similar meanings but refer to visual word counts. All counts are computed for document $d$ by excluding the $n$-th word.



\section*{Appendix B: MM-DTM Model Estimation}

The static part of the model uses Gibbs sampling method for parameter inference.Firstly, Gibbs sampling requires the joint density of parameters, which is calculated through integration:
$$
P\left(\vec{W}_w, \vec{W}_v, \vec{Z}, \vec{U} \mid \Theta\right)=\iint P\left(\vec{W}_w, \vec{W}_v, \vec{Z}, \vec{U}, \vec{\theta}, \vec{\beta}, \vec{\phi}, \rho \mid \Theta\right) d \vec{\theta} d \rho
$$

Where $\vec{Z}$ denotes topics of all textual words and visual words, $\vec{U}$ denotes indicators of all textual words and visual words, $\Theta$ denotes all hyperparameters, $\theta$ denotes the topic distribution, $\beta$ and $\vec{\phi}$ denotes the topic-word distribution, and $\rho$ denotes the bernoulli probability of indicators $\vec{U}$.

Then, the density functions for each part of the textual segment are articulated as follows:
$$
\begin{aligned}
	& P\left(\vec{\bar{W}}_w \mid \vec{\beta}\right)=\prod_{b=1}^B \prod_{d_b=1}^{D_b} \prod_{w=1}^{N_{d_b}} P\left(W_{d_{b, w}} \mid \vec{\beta^g}, \vec{\beta_b^s}\right) \\
	&=\left[\prod_{b=1}^B \prod_{k_b=1}^{K_b^s} \prod_{r=1}^{V_w} {\beta^s_{k_b, r}}^{n_{(\cdot), r}^{k_b, s}}\right] \cdot\left[\prod_{k=1}^{K_0} \prod_{r=1}^{V_w} {\beta_{k, r}^g}^{n_{(\cdot), r}^{k, g}} \right] \\
	&P(\vec{Z}_w \mid \vec{\theta})=\prod_{b=1}^B \prod_{d_b=1}^{D_b} \prod_{w=1}^{N_{d_b}} P\left(Z_{d_b, w} \mid \vec{\theta_{d_b}}\right) \\
	& =\left[\prod_{b=1}^B \prod_{d_b=1}^{D_b} \prod_{k_b=1}^{K_b^s} {\theta_{d_b, k_b}^s}^ {n_{d_b, (\cdot)}^{k_b, s}}\right] \cdot\left[\prod_{b=1}^B \prod_{d_b=1}^{D_b} \prod_{k=1}^{K_0} {\theta_{d_b, k}^g}^{n_{d_b(\cdot)}^{k, g}}\right]\\
	& P\left(\vec{U_w} \mid \rho\right)=\left[\prod_{b=1}^B \prod_{d_b=1}^{D_b} \prod_{v=1}^{M_{d_b}} P\left(U_{d_b, v} \mid \rho\right)\right]=\rho^{n_{(\cdot)}^1} \cdot(1-\rho)^{n_{(\cdot)}^0} \\
\end{aligned}
$$

Where the count variable $n_{3,4}^{1,2}$ represents the count of textual words, where the first position denotes the topic number, the second position $s$ or $g$ indicates a general or specific topic, the third position represents the document number, and the fourth position denotes the word number. The symbol $(\cdot)$ represents summation over all values at that position. Similarly, $m$ denotes the count of visual words. And the variable $n_{(\cdot)}^1$ represents the summation of text word counts under all general topics, while $n_{(\cdot)}^0$ denotes the summation of text word counts under all specific topics. Similarly, $m_{(\cdot)}^1$ and $m_{(\cdot)}^0$ represent the count of visual words.

Additionally, the density functions for each part of the visual word segment are outlined as follows:
$$
\begin{aligned}
	& P\left(\vec{W}_v \mid \vec{\beta}\right)=\left[\prod_{b=1}^B \prod_{k_b=1}^{K_b^s} \prod_{r=1}^{V_v} {\phi_{k_b, r}^s}^{ m_{(\cdot), r}^{k_b, s}}\right] \cdot\left[\prod_{k=1}^{K_0} \prod_{r=1}^{V_v} {\phi_{k, r}^g}^{m_{(\cdot), r}^{k, g}}\right] \\
	& P(\vec{Z}_v \mid \vec{\theta})=\left[\prod_{b=1}^B \prod_{d_b=1}^{D_b} \prod_{k_b=1}^{K_b^s} {\theta_{d_b, k_b}^s}^{m_{d_{b}, (\cdot)}^{k_b, s}} \right] \cdot\left[\prod_{b=1}^B \prod_{d_b=1}^{D_b} \prod_{k=1}^{K_0} {\theta_{d_b, k}^g}^{m_{d_{b,(\cdot)}}^{k, g}} \right] \\
	& P\left(\vec{U_v} \mid \rho\right)=\left[\prod_{b=1}^B \prod_{d_b=1}^{D_b} \prod_{v=1}^{M_{d_b}} P\left(U_{d_b, v} \mid \rho\right)\right]=\rho^{m_{(\cdot)}^1} \cdot(1-\rho)^{m_{(\cdot)}^0} \\
\end{aligned}
$$
Where the word Indicator $U_{bij}$: The indicator for the $j^{th}$ word in the $i^{th}$ document under brand $b$, determining whether the word belongs to a general or specific topic. The subscripts $w$ and $v$ indicate whether it is a textual or visual word.

And the density function of the prior distribution:
$$
\begin{gathered}
	P\left(\vec{\theta_d^s}, \vec{\theta_d^g} \mid \alpha\right)=\left[\prod_{b=1}^B \prod_{d_b=1}^{D_b} \frac{\Gamma\left(K_b^s \alpha\right)}{\prod_{k_b=1}^{K_b^s} \Gamma(\alpha)} \prod_{k_b=1}^{K_b^s}\left(\theta_{d_b, k_b}^s\right)^{\alpha-1}\right]\\
	\cdot\left[\prod_{b=1}^B \prod_{d_b=1}^{D_b} \frac{\Gamma\left(K_0 \alpha\right)}{\prod_{k=1}^{K_0} \Gamma(\alpha)} \prod_{k=1}^{K_0}\left(\theta_{d_b, k}^g\right)^{\alpha-1}\right] \\
	P(\rho \mid \gamma)=\frac{\rho^{\gamma-1} \cdot(1-\rho)^{\gamma-1}}{B(\gamma, \gamma)}
\end{gathered}
$$

Multiplying them together and the joint probability obtained by integration is:
$$
{\left[\prod_{b=1}^B \prod_{k_b=1}^{K_b^S} \prod_{r=1}^{V_v} {\phi_{k_b, r}^s}^{m_{(\cdot), r}^{k_b, s}}\right] \cdot\left[\prod_{k=1}^{K_0} \prod_{r=1}^{V_v} {\phi_{k, r}^g}^{m_{(\cdot), r}^{k, g}} \right]}\cdot {\left[\prod_{b=1}^B \prod_{k_b=1}^{K_b^S} \prod_{r=1}^{V_w} \beta_{k_b, r}^s{ }^{n_{(\cdot), r}^{k_b, s}}\right]}\cdot  \\
$$
$$
\left[\prod_{k=1}^{K_0} \prod_{r=1}^{V_w} {\beta_{k, r}^g}^{ n_{(\cdot), r}^{k, g}}\right] \cdot \frac{B\left(\gamma+n_{(\cdot)}^1+m_{(\cdot)}^1, \gamma+n_{(\cdot)}^0+m_{(\cdot)}^0\right)}{B(\gamma, \gamma)}\cdot \\
$$
$$
{\left[\prod_{b=1}^B \prod_{d_b=1}^{D_b}\left(\frac{\Gamma\left(K_b^s \alpha\right)}{\prod_{k_b=1}^{K_b^s} \Gamma(\alpha)} \frac{\prod_{k_b=1}^{K_b^s} \Gamma\left(n_{d_b,(\cdot)}^{k_b, s}+m_{d_b,(\cdot)}^{k_b, s}+\alpha\right)}{\Gamma\left(n_{d_b,(\cdot)}^{(\cdot), s}+m_{d_b,(\cdot)}^{(\cdot), s}+K_b^s \alpha\right)}\right)\right] .} \\
$$
$$
{\left[\prod_{b=1}^B \prod_{d_b=1}^{D_b}\left(\frac{\Gamma\left(K_0 \alpha\right)}{\prod_{k=1}^{K_0} \Gamma(\alpha)} \frac{\prod_{k=1}^{K_0} \Gamma\left(n_{d_b,(\cdot)}^{k, g}+m_{d_b,(\cdot)}^{k, g}+\alpha\right)}{\Gamma\left(n_{d_b,(\cdot)}^{(\cdot),}+m_{d_b,(\cdot)}^{(\cdot), g}+K_0 \alpha\right)}\right)\right]} \\
$$

In the above formula, $n$ and $m$ respectively represent the counts of textual words and visual words.

We define variational parameters for topic distributions $r_{b i j k, g}^w; r_{b i j k, g}^w; r_{b i j k, g}^v; r_{b i j k, g}^v$: The variational probability that the $j^{th}$ word in the $i^{th}$ document under brand $b$ belongs to the $k^{th}$ topic, with superscripts $w$ and $v$ indicating textual or visual words, respectively. The $s$ and $g$ denote whether it is a specific or general topic.

Following the Collapsed Gibbs algorithm for deriving the update formula, the estimates for $\mathrm{r}_{\mathrm{bijk}, \mathrm{s}}$ and $\mathrm{r}_{\mathrm{bijk}, \mathrm{g}}$ can be obtained. These estimates are directly substituted into the joint probability. The counts below are excluding the count of the word being updated, assuming the count of this word does not exist:
$$
\begin{aligned}
	& \left.r_{b i j k, g}^w=P\left(Z_{b i j, g}^w=k\right)=P\left(Z_{b i j, g}^w=k \mid \stackrel{\rightharpoonup}{U}, \vec{W}, \vec{Z}\right\urcorner b i j, g, \Theta\right) \\
	& =1\left(U_{b i j, w}=1\right) \cdot \frac{\alpha+n_{i,(\cdot)}^{k, g}+m_{i,(\cdot)}^{k, g}}{K_0 \alpha+n_{i,(\cdot)}^{(\cdot), g}+m_{i,(\cdot)}^{(\cdot), g}} \cdot \beta_{k, w}^g \\
	&
\end{aligned}
$$

Similarly, other update formulas can be derived as follows:
$$
\begin{gathered}
	r_{b i j k, s}^w=P\left(Z_{b i j, s}^w=k\right)=1\left(U_{b i j, w}=0\right) \cdot \frac{\alpha+n_{i,(\cdot)}^{k, s}+m_{i,(\cdot)}^{k, s}}{K_b^s \alpha+n_{i,(\cdot)}^{(\cdot), s}+m_{i,(\cdot)}^{(\cdot), s}} \cdot \beta_{k_{b, w}}^s \\
	r_{b i j k, g}^v=P\left(Z_{b i j, g}^v=k\right)=1\left(U_{b i j, v}=1\right) \cdot \frac{\alpha+n_{i,(\cdot)}^{k, g}+m_{i,(\cdot)}^{k, g}}{K_0 \alpha+n_{i,(\cdot)}^{(\cdot), g}+m_{i,(\cdot)}^{(\cdot), g}} \cdot \phi_{k, v}^g \\
	r_{b i j k, s}^v=P\left(Z_{b i j, s}^v=k\right)=1\left(U_{b i j, v}=0\right) \cdot \frac{\alpha+n_{i,(\cdot)}^{k, s}+m_{i,(\cdot)}^{k, s}}{K_b^s \alpha+n_{i,(\cdot)}^{(\cdot), s}+m_{i,(\cdot)}^{(\cdot), s}} \cdot \phi_{k_{b, v}}^s \\
	P\left(U_{b i j, w}=1\right)=\frac{\alpha+n_{i,(\cdot)}^{k, g}+m_{i,(\cdot)}^{k, g}}{K_0 \alpha+n_{i,(\cdot)}^{(\cdot), g}+m_{i,(\cdot)}^{(\cdot), g}} \cdot \frac{\gamma+n_{(\cdot)}^1+m_{(\cdot)}^1}{2 \gamma+n_{(\cdot)}+m_{(\cdot)}} \cdot \beta_{k, w}^g \\
	P\left(U_{b i j, w}=0\right)=\frac{\alpha+n_{i,(\cdot)}^{k, s}+m_{i,(\cdot)}^{k, s}}{K_b^s \alpha+n_{i,(\cdot)}^{(\cdot), s}+m_{i,(\cdot)}^{(\cdot), s}} \cdot \frac{\gamma+n_{(\cdot)}^0+m_{(\cdot)}^0}{2 \gamma+n_{(\cdot)}+m_{(\cdot)}} \cdot \beta_{k_{b, w}^s}^s \\
	P\left(U_{b i j, v}=1\right)=\frac{\alpha+n_{i,(\cdot)}^{k, g}+m_{i,(\cdot)}^{k, g}}{K_0 \alpha+n_{i,(\cdot)}^{(\cdot), g}+m_{i,(\cdot)}^{(\cdot), g}} \cdot \frac{\gamma+m_{(\cdot)}^1+n_{(\cdot)}^1}{2 \gamma+n_{(\cdot)}+m_{(\cdot)}} \cdot \phi_{k, v}^g \\
	P\left(U_{b i j, v}=0\right)=\frac{\alpha+n_{i,(\cdot)}^{k, s}+m_{i,(\cdot)}^{k, s}}{K_b^s \alpha+n_{i,(\cdot)}^{(\cdot), s}+m_{i,(\cdot)}^{(\cdot), s}} \cdot \frac{\gamma+n_{(\cdot)}^0+m_{(\cdot)}^0}{2 \gamma+n_{(\cdot)}+m_{(\cdot)}} \cdot \phi_{k_{b, v}^s}^s
\end{gathered}
$$

In the update formula for $U$, where $k$ represents the corresponding topic for the word, the estimation formula for the word distribution can subsequently be derived as follows:

$$
\begin{aligned}
	\beta_{b, v}^{k, s}\propto \frac{n_{(\cdot), v}^{k, s}}{n_{(\cdot),(\cdot)}^{k, s}} \quad
	\beta_{b, v}^{k, g}\propto \frac{n_{(\cdot), v}^{k, g}}{n_{(\cdot),(\cdot)}^{k, g}} \quad
	\phi_{b, v}^{k, s}\propto \frac{m_{(\cdot), v}^{k, s}}{m_{(\cdot),(\cdot)}^{k, s}} \quad
	\phi_{b, v}^{k, g}\propto \frac{m_{(\cdot), v}^{k, g}}{m_{(\cdot),(\cdot)}^{k, g}}
\end{aligned}
$$


For the second part, the dynamic aspect of model update formulas inference:
Assuming $\beta_{t, k} \mid \beta_{t-1, k} \sim N\left(\beta_{t-1, k}, \sigma^2 I\right)$, a variational distribution for $\beta$ is then introduced:
$$
\widehat{\beta}_{t, k} \mid \beta_{t, k} \sim N\left(\beta_{t, k}, \hat{v}_t^2 I\right)
$$

Below, the subscript $k$ for the topic is omitted because the same process is applied to each word distribution $\beta$, and different word distributions $\beta$ are independent of each other. The overall likelihood only needs a product from $k=1$ to $K$, and then the last update of $\beta$ by taking the partial derivative will eliminate the product, leaving only the current topic $k$'s term. Therefore, only a specific topic is considered below.

We use $\widetilde{m}_{t w}$ and $\widetilde{V}_{t w}$ to denote the backward mean and the backward variance of Kalman filtering algorithm, while $m_{t w}$ and $V_{t w}$ denote the forward mean and the forward variance. And $\widehat{\beta}_{t w}$ denotes the variational distribution of $\beta_{t w}$ and $\hat{v}_t^2$ denotes the variance of the variational distribution. Besides, $\sigma^2$ denotes the variance of the evolution of word distribution which characterized as a conditional normal distribution.

This part is the same as the parameter inference of the DTM model, using conjugate gradient method to update the parameter:
$$
\begin{aligned}
	& \frac{\partial l(\widehat{\beta}, \hat{v})}{\widehat{\beta}_{t w}}=-\frac{1}{\sigma^2} \sum_{t=1}^T\left(\widetilde{m}_{t w}-\widetilde{m}_{t-1, w}\right)\left(\frac{\partial \widetilde{m}_{t w}}{\partial \widehat{\beta}_{t w}}-\frac{\partial \widetilde{m}_{t-1, w}}{\partial \widehat{\beta}_{t w}}\right) \\
	& +\sum_{t=1}^T\left(n_{t w}-n_t \hat{\zeta}_t^{-1} \exp \left(\widetilde{m}_{t w}+\frac{\widetilde{V}_{t w}}{2}\right)\right) \frac{\partial \widetilde{m}_{t w}}{\partial \widehat{\beta}_{t w}}
\end{aligned}
$$

Where $n_t=\sum_w n_{t w}, \hat{\zeta}_t=\sum_w \exp \left(\widetilde{m}_{t w}+\frac{\widetilde{V}_{t w}}{2}\right)$.

Given $\partial m_0 / \partial \widehat{\beta}_s=0$, the forward derivative is calculated as:
$$
\frac{\partial m_t}{\partial \widehat{\beta}_s}=\left(\frac{\hat{v}_t^2}{\hat{v}_t^2+\sigma^2+V_{t-1}}\right) \frac{\partial m_{t-1}}{\partial \widehat{\beta}_s}+\left(1-\frac{\hat{v}_t^2}{\hat{v}_t^2+\sigma^2+V_{t-1}}\right) \delta_{s, t}
$$

Where $\delta_{s, t}$ is an indicator function, taking value 1 when $s=t$.

Given $\partial \widetilde{m}_T / \partial \widehat{\beta}_s=\partial m_T / \partial \widehat{\beta}_s$, the backward derivative is calculated as:
$$
\frac{\partial \widetilde{m}_{t-1}}{\partial \widehat{\beta}_s
}=\left(\frac{\sigma^2}{\sigma^2+V_{t-1}}\right) \frac{\partial m_{t-1}}{\partial \widehat{\beta}_s}+\left(1-\frac{\sigma^2}{\sigma^2+V_{t-1}}\right) \frac{\partial \widetilde{m}_t}{\partial \widehat{\beta}_s}
$$


\section*{Appendix C: The Detailed Setting of Candidate Models in Real Data Analysis}

\renewcommand\theequation{B.\arabic{equation}}
\setcounter{table}{0}
\setcounter{figure}{0}
\renewcommand{\thetable}{C.\arabic{table}}
\renewcommand{\thefigure}{C.\arabic{figure}}

\begin{table}[htp]
	\centering
	\caption{The Number of Topics in Candidate Models in ZOL Data }
	\resizebox{\linewidth}{!}{
	\begin{tabular}{lcccccccl}
		\hline
		\textbf{} & \multicolumn{1}{l}{Model 1} & \multicolumn{1}{l}{Model 2}  & \multicolumn{1}{l}{Model 3}  & \multicolumn{1}{l}{Model 4}  & \multicolumn{1}{l}{Model 5}  & \multicolumn{1}{l}{Model 6}           & \multicolumn{1}{l}{Model 7}  & Model 8                   \\ \hline
		General Topics      & 1                       & 2                        & 2                        & 3                        & 3                        & 3                                 & 3                        & \multicolumn{1}{c}{4} \\
		Huawei        & 1                       & 1                        & 2                        & 2                        & 2                        & 2                                 & 2                        & \multicolumn{1}{c}{2} \\
		VIVO      & 1                       & 1                        & 1                        & 1                        & 1                        & 1                                 & 2                        & \multicolumn{1}{c}{2} \\
		Samsung        & 1                       & 1                        & 1                        & 1                        & 1                        & 2                                 & 2                        & \multicolumn{1}{c}{2} \\
		OPPO      & 1                       & 1                        & 1                        & 1                        & 2                        & 2                                 & 2                        & \multicolumn{1}{c}{2} \\ \hline
		& \multicolumn{1}{l}{Model 9} & \multicolumn{1}{l}{Model 10} & \multicolumn{1}{l}{Model 11} & \multicolumn{1}{l}{Model 12} & \multicolumn{1}{l}{Model 13} & \multicolumn{1}{l}{Model 14} & \multicolumn{1}{l}{Model 15} &                       \\ \hline
		General Topics      & 4                       & 5                        & 5                        & 5                        & 5                        & 5                        & 6                        &                       \\
		Huawei        & 2                       & 2                        & 3                        & 3                        & 4                        & 4                        & 4                        &                       \\
		VIVO      & 2                       & 2                        & 2                        & 2                        & 2                        & 3                        & 3                        &                       \\
		Samsung        & 3                       & 3                        & 3                        & 4                        & 4                        & 4                        & 4                        &                       \\
		OPPO      & 2                       & 2                        & 2                        & 2                        & 2                        & 2                        & 2                        &                       \\ \hline
	\end{tabular}
}
	\label{tabl:phone_tn}
\end{table}



\end{document}



\endinput
%%
%% End of file `elsarticle-template-harv.tex'.
