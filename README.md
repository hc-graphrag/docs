# GraphRAG docs

このリポジトリは、情報の圧縮とコンテキスト注入という原理に基づく設計資料と、その原理を具体化する最初の方式候補として GraphRAG を検証するための資料を管理します。

GraphRAG は、原理から一意に導かれた唯一の方式でも、他方式との比較で優位性が確定した方式でもありません。関係構造と複数の解像度を保持できる可能性があるため、まず採用して試している候補です。

## 読み始める場所

- [資料一覧](INDEX.md)
- [情報圧縮とコンテキスト注入の原理](docs/information-compression-and-context-injection.md)
- [RAG という実装語と上位原理の関係](docs/rag-primer.md)
- [圧縮・注入の評価方式](docs/evaluation.md)

実行可能な検証コードは [hc-graphrag/rag-usecase-demos](https://github.com/hc-graphrag/rag-usecase-demos)、現在の GraphRAG 実装は [hc-graphrag/llamaindex-python](https://github.com/hc-graphrag/llamaindex-python) で管理します。

