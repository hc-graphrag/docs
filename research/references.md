# 参考事例と一次資料

調査確認日: 2026-11-17。リンク先は変化するため、判断前に再確認してください。

## 原理・圧縮

- Claude E. Shannon, [A Mathematical Theory of Communication](https://web.mit.edu/6.441/spring05/reading/shannon1948.pdf) — 情報量と符号化を考える基礎。RAG や GraphRAG を直接論じる文献ではありません。
- Naftali Tishby, Fernando C. Pereira, William Bialek, [The Information Bottleneck Method](https://arxiv.org/abs/physics/0004057) — 入力を圧縮しながら目的に有用な情報を保持する枠組み。プロジェクトの設計原則との接続は本プロジェクトによる解釈です。
- Fangyuan Xu et al., [RECOMP: Improving Retrieval-Augmented LMs with Compression and Selective Augmentation](https://openreview.net/forum?id=5BIslWfM7H) — 取得文書を圧縮してコンテキストへ統合する研究例。
- Nelson F. Liu et al., [Lost in the Middle](https://arxiv.org/abs/2307.03172) — 長いコンテキスト内での情報位置と利用性能を扱う研究。

## GraphRAG 実装資料

- [hc-graphrag/llamaindex-python](https://github.com/hc-graphrag/llamaindex-python) — 本プロジェクトが最初の方式候補として検証する既存実装。確認時、local/global/DRIFT search などのコードパスが存在します。
- [既存実装の検索コード](https://github.com/hc-graphrag/llamaindex-python/tree/main/src/graphrag_anthropic_llamaindex)
- [LlamaIndex indexing guide](https://github.com/run-llama/llama_index/blob/main/docs/src/content/docs/framework/module_guides/indexing/index_guide.md) — Property Graph Index、抽出カスタマイズ、検索方法の公式説明。
- [LlamaIndex PropertyGraphIndex source](https://github.com/run-llama/llama_index/blob/main/llama-index-core/llama_index/core/indices/property_graph/base.py) — APIと既定値は使用版で要確認。
- [Microsoft GraphRAG repository](https://github.com/microsoft/graphrag) と [documentation](https://microsoft.github.io/graphrag/) — 公開実装とガイド。要件・費用は対象バージョンとデータで評価します。

## GraphRAG の公開研究・データ事例

- Darren Edge et al., [From Local to Global: A Graph RAG Approach to Query-Focused Summarization](https://arxiv.org/abs/2404.16130) は、エンティティグラフとコミュニティ要約を用いて全体質問へ対応する方法を報告しています。当該評価条件での研究結果であり、すべての業務や質問での優位性を意味しません。
- Microsoft公式 [indexing overview](https://microsoft.github.io/graphrag/index/overview/) は、エンティティ・関係・claim抽出、コミュニティ検出、複数粒度の要約生成、テキスト埋め込みを説明しています。出力形式や処理は設定・バージョンに依存します。
- [Microsoft GraphRAG benchmarking datasets](https://github.com/microsoft/graphrag-benchmarking-datasets) は公開ベンチマーク事例です。企業内保全・契約・医療データの代表データとは限りません。

## このプロジェクトでの解釈

確認済み: 指定リポジトリに local/global/DRIFT 関連のコードパスがあること、公開資料がグラフ抽出・コミュニティ要約・複数解像度の検索を説明していること。

プロジェクト判断: 情報圧縮とコンテキスト注入という原理に対し、関係構造と複数解像度を保持する方式候補として GraphRAG をまず採用します。

未確認: GraphRAG の一般的優位性、現在の各機能の動作、互換性、性能、セキュリティ、顧客環境での効果。採用は検証の出発点であり、実証済みの結論ではありません。

