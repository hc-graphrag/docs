# GraphRAG docs

このリポジトリは、情報の圧縮とコンテキスト注入という原理に基づく設計資料と、その原理を具体化する最初の方式候補として GraphRAG を検証するための資料を管理します。

GraphRAG は、原理から一意に導かれた唯一の方式でも、他方式との比較で優位性が確定した方式でもありません。一方、関係構造と複数の解像度を使った高度な回答基盤を比較的手軽に構築しやすいため、あそぴてっくが標準化・テンプレート化を進める最初の方式候補です。

利用者へ方式選定を求めることは目的ではありません。技術者側でコストと品質を比較・管理し、短期間で業務に使える回答へ到達しやすくすることで、利用者が本来のビジネス課題に集中できる状態を目指します。

## 読み始める場所

- [資料一覧](INDEX.md)
- [情報圧縮とコンテキスト注入の原理](docs/information-compression-and-context-injection.md)
- [GraphRAGテンプレートによる短期導入モデル](docs/graphrag-delivery-model.md)
- [RAG という実装語と上位原理の関係](docs/rag-primer.md)
- [圧縮・注入の評価方式](docs/evaluation.md)

実行可能な検証コードは [hc-graphrag/rag-usecase-demos](https://github.com/hc-graphrag/rag-usecase-demos)、現在の GraphRAG 実装は [hc-graphrag/llamaindex-python](https://github.com/hc-graphrag/llamaindex-python) で管理します。

