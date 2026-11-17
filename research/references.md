# 参考事例と一次資料

調査確認日: 2026-11-17。設計判断では、対象バージョンの一次資料を再確認します。

## RAGの基礎

- Patrick Lewis et al., [Retrieval-Augmented Generation for Knowledge-Intensive NLP Tasks](https://arxiv.org/abs/2005.11401) — パラメトリック記憶と、検索可能な非パラメトリック記憶を生成へ結合するRAG原論。
- Kelvin Guu et al., [REALM: Retrieval-Augmented Language Model Pre-Training](https://arxiv.org/abs/2002.08909) — 大規模コーパスから文書を取得し、言語モデルが参照する構成。
- Vladimir Karpukhin et al., [Dense Passage Retrieval for Open-Domain Question Answering](https://aclanthology.org/2020.emnlp-main.550/) — 質問とパッセージを密ベクトルで照合する候補取得。
- Omar Khattab and Matei Zaharia, [ColBERT](https://arxiv.org/abs/2004.12832) — トークン単位の遅延相互作用による効率的な検索・順位付け。
- Gautier Izacard and Edouard Grave, [Fusion-in-Decoder](https://aclanthology.org/2021.eacl-main.74/) — 複数の取得パッセージを個別に符号化し、生成段階で証拠を統合する方法。

## 階層化・圧縮・コンテキスト編成

- Parth Sarthi et al., [RAPTOR](https://arxiv.org/abs/2401.18059) — チャンクをクラスタリング・要約して再帰的な木を作り、複数の抽象度から取得する方法。
- Fangyuan Xu et al., [RECOMP](https://proceedings.iclr.cc/paper_files/paper/2024/hash/bda88ed2892f5e61c9a9bf215c566913-Abstract-Conference.html) — 取得文書を抽出的・生成的に圧縮し、選択的にコンテキストへ追加する方法。
- Nelson F. Liu et al., [Lost in the Middle](https://aclanthology.org/2024.tacl-1.9/) — 長いコンテキスト内で、関連情報の位置が利用性能へ与える影響。
- Huiqiang Jiang et al., [LongLLMLingua](https://arxiv.org/abs/2310.06839) — 長いコンテキストでの情報密度、位置、圧縮を扱う方法。

## 上位原理

- Claude E. Shannon, [A Mathematical Theory of Communication](https://web.mit.edu/6.441/spring05/reading/shannon1948.pdf) — 情報量と符号化の基礎。
- Naftali Tishby, Fernando C. Pereira, William Bialek, [The Information Bottleneck Method](https://arxiv.org/abs/physics/0004057) — 目的に有用な情報を保持しながら入力を圧縮する枠組み。

## GraphRAG

- Darren Edge et al., [From Local to Global: A Graph RAG Approach to Query-Focused Summarization](https://arxiv.org/abs/2404.16130) — 実体グラフ、コミュニティ要約、部分回答の統合を用いた全体質問への方法。
- Microsoft GraphRAG, [Indexing Dataflow](https://microsoft.github.io/graphrag/index/default_dataflow/) — Document、TextUnit、実体、関係、主張、コミュニティ、レポート、埋め込みへ至る変換。
- Microsoft GraphRAG, [Indexing Methods](https://microsoft.github.io/graphrag/index/methods/) — 実体・関係抽出、要約、標準方式と高速方式の構成。
- Microsoft GraphRAG, [Query methods](https://microsoft.github.io/graphrag/query/overview/) — local、global、DRIFT、basic searchの公式説明。
- [Microsoft GraphRAG repository](https://github.com/microsoft/graphrag) — 公開実装。
- [Microsoft GraphRAG benchmarking datasets](https://github.com/microsoft/graphrag-benchmarking-datasets) — 公開ベンチマーク用データ。

## 実装資料

- [hc-graphrag/llamaindex-python](https://github.com/hc-graphrag/llamaindex-python) — GraphRAG標準テンプレートの実装基盤。local、global、DRIFT関連のコードパスを含みます。
- [既存実装の検索コード](https://github.com/hc-graphrag/llamaindex-python/tree/main/src/graphrag_anthropic_llamaindex)
- LlamaIndex, [Loading Data](https://developers.llamaindex.ai/python/framework/module_guides/loading/) — 取り込み、変換、Node生成。
- LlamaIndex, [Retriever](https://developers.llamaindex.ai/typescript/framework/modules/rag/retriever/) — 複数の取得方式。
- LlamaIndex, [Node Postprocessors](https://developers.llamaindex.ai/python/framework/module_guides/querying/node_postprocessors/node_postprocessors/) — 取得後の変換、フィルタ、再順位付け。
- LlamaIndex, [Response Synthesizer](https://developers.llamaindex.ai/typescript/framework/modules/rag/response_synthesizer/) — 取得ノードの統合と回答生成。

## このリポジトリでの位置づけ

[RAGのシステムモデル](../rag-system-model.md) で、取得、階層化、マッチング、圧縮、復元、コンテキスト編成、生成、検証を分解します。

[情報圧縮・階層化・復元・コンテキスト注入の原理](../information-compression-and-context-injection.md) で、それらをRAG以外の利用主体にも適用できる上位モデルとして定義します。

GraphRAGをRAG導入の標準テンプレートとしてご提案し、案件では実データを使って品質、費用、期間、適用範囲を測定します。
