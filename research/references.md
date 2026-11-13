# 参考事例と一次資料

調査確認日: 2026-11-12。リンク先は変化するため、判断前に再確認してください。

## 実装資料

- [hc-graphrag/llamaindex-python](https://github.com/hc-graphrag/llamaindex-python) — 指定された既存実装。確認時、src/graphrag_anthropic_llamaindex 配下に local/global/DRIFT search などのコードパスが存在。参照実装であり上流最新版と同一とは限りません。
- [既存実装の検索コード](https://github.com/hc-graphrag/llamaindex-python/tree/main/src/graphrag_anthropic_llamaindex)
- [LlamaIndex indexing guide](https://github.com/run-llama/llama_index/blob/main/docs/src/content/docs/framework/module_guides/indexing/index_guide.md) — Property Graph Index、抽出カスタマイズ、検索方法の公式説明。
- [LlamaIndex PropertyGraphIndex source](https://github.com/run-llama/llama_index/blob/main/llama-index-core/llama_index/core/indices/property_graph/base.py) — APIと既定値は使用版で要確認。
- [Microsoft GraphRAG repository](https://github.com/microsoft/graphrag) と [documentation](https://microsoft.github.io/graphrag/) — 公開実装とガイド。要件・費用は対象バージョンとデータで評価します。

## 公開研究・データ事例

- [From Local to Global: A Graph RAG Approach to Query-Focused Summarization](https://arxiv.org/abs/2404.16130) は、エンティティグラフを作成し、関連エンティティ群のコミュニティ要約を事前生成して、全体質問への部分回答を統合する方法を報告しています。著者らは約100万トークン規模のデータセット上の一種の global sensemaking 質問で、naive RAG と比べ回答の包括性・多様性の改善を報告しています。これは当該評価条件での研究結果で、すべての業務文書・質問での優位性を意味しません。
- Microsoft公式 [indexing overview](https://microsoft.github.io/graphrag/index/overview/) は、標準パイプラインでエンティティ・関係・claim抽出、コミュニティ検出、複数粒度の要約生成、テキスト埋め込みを行うと説明しています。出力形式や処理は設定・バージョンに依存します。
- [Microsoft GraphRAG benchmarking datasets](https://github.com/microsoft/graphrag-benchmarking-datasets) には、HotPotQA と、ポッドキャストから作成した125件のテーマ別・複数文書要約質問のデータセットが記載されています。公開ベンチマーク事例であり、企業内保全・契約・医療データの代表データではありません。

## 確認済みと未確認

確認済み: 指定リポジトリに local/global/DRIFT 関連のコードパスがあること、LlamaIndex公式ガイドがProperty Graph Indexと検索部品を説明すること、Microsoft公式資料がグラフ抽出・コミュニティ要約の標準パイプラインと公開ベンチマークデータを記載していること。

未確認: 現在の各機能の動作、互換性、性能、セキュリティ、顧客環境での効果。選定時にコード、依存固定、ライセンス、テストを直接確認してください。
