# RAG / GraphRAGの既存評価研究とデータ準備資料

最終確認日: 2026-11-17

## 調査結果

RAG / GraphRAGには、検索結果や生成回答の品質を測る研究・評価枠組みがあります。また、データのAI利用準備を扱う公的ガイドや、RAG導入前の実務チェックリストも公開されています。

今回確認した範囲では、これらを統合して、あらゆる業務に共通する「RAG導入準備度」の合否や数値基準を定めた標準は確認できませんでした。研究で提案された品質指標、公的なデータ準備ガイド、事業者の実務チェックリストは、対象と目的が異なります。

この資料は、既存の評価研究・公開資料の内容と適用範囲を整理します。あそぴてっくが業務ごとに用いる質問票は、[あそぴてっくのGraphRAG適用アセスメント](../enterprise-data-assessment.md)に分けています。

## 1. 既存研究のRAG評価枠組み

### RAGAS

[RAGAS: Automated Evaluation of Retrieval Augmented Generation](https://aclanthology.org/2024.eacl-demo.16/) は、検索された文脈の関連性、回答の忠実性、回答の関連性を分けて評価する枠組みです。論文は、参照回答がない状況での自動評価を扱います。

この枠組みは、回答が取得文脈に裏付けられているか、質問に答えているか、検索文脈に不要な情報が多く含まれていないかを調べる参考になります。業務に固有のデータ準備、アクセス権、情報源の責任者、更新・削除の準備状況を判定するものではありません。

### ARES

[ARES: An Automated Evaluation Framework for Retrieval-Augmented Generation Systems](https://aclanthology.org/2024.naacl-long.20/)（NAACL 2024）は、文脈の関連性、回答の忠実性、回答の関連性を評価します。自動判定モデルに加えて少数の人手評価を利用し、評価の不確かさを扱う方法を提案しています。

人手確認を含めた評価設計の参考になります。一方、論文の評価軸が、そのまま各業務の導入可否や合格点になるわけではありません。

### GraphRAG-Bench

[GraphRAG-Bench: Challenging Domain-Specific Reasoning for Evaluating Graph Retrieval-Augmented Generation](https://arxiv.org/abs/2506.02404)（2025年公開の研究論文）は、グラフ構築、知識検索、回答生成を含むパイプラインを評価します。複数段階の推論を要する質問などを扱い、最終回答だけでなく推論の一貫性も評価対象にしています。

GraphRAGの評価対象を、回答文の正誤だけに限定しないための参考です。特定の業務で必要なデータ権限や運用体制を判定する準備度チェックリストではありません。

## 2. 公開されているガイドと実務資料

### Microsoft GraphRAGの透明性資料

[Microsoft GraphRAG Responsible AI Transparency Note](https://github.com/microsoft/graphrag/blob/main/RAI_TRANSPARENCY.md) は、複数文書にまたがる情報や全体傾向を問う用途、回答の根拠・出典の確認、人による確認、プロンプトやデータ経由の攻撃、幻覚の評価などを説明しています。独自データでは小さなサンプルで索引処理を確認することも勧めています。

GraphRAGの適用条件や確認すべきリスクを考える参考になります。これは、すべての案件に適用できる採点式のアセスメントではありません。

### Microsoft FoundryのRAG評価資料

[Retrieval-Augmented Generation Evaluators](https://learn.microsoft.com/en-us/azure/foundry/concepts/evaluation-evaluators/rag-evaluators) は、検索段階と回答段階を分けた評価方法を説明します。検索対象の正解ラベルがある場合の順位指標や、ラベルがない場合のLLM判定などを扱っています。

製品ドキュメントの評価方法であり、独立した業界標準ではありません。評価指標を選ぶ際の実装例として参照できます。

### 英国政府のAI向けデータ準備ガイド

[Guidelines and best practices for making government datasets ready for AI](https://www.gov.uk/government/publications/making-government-datasets-ready-for-ai/guidelines-and-best-practices-for-making-government-datasets-ready-for-ai) は、技術的な最適化、データとメタデータの品質、組織・基盤、法務・セキュリティ・倫理を含む観点を示しています。RAG専用ではありませんが、データをAIで利用する前の準備や責任分担を考える公的資料です。

### Microsoft ResearchのBenchmarkQED記事

[BenchmarkQED: Automated benchmarking of RAG systems](https://www.microsoft.com/en-us/research/blog/benchmarkqed-automated-benchmarking-of-rag-systems/) は、GraphRAGを含むRAG方式の比較例を紹介しています。全体質問に対する回答の網羅性、多様性、理解・判断への有用性、質問への関連性を評価しています。

これは特定のデータセット、質問、モデルで行った比較の紹介です。評価軸の例として読めますが、その結果や順位を別の業務へ一般化することはできません。

### 実務者によるデータ準備チェックリスト

[Enterprise Data Preparation for RAG: Readiness Guide](https://www.lucentinnovation.com/resources/it-insights/architecting-enterprise-data-for-rag-success) は、業務範囲、情報源の責任者、文書抽出、メタデータ、アクセス権、更新・削除、検索、回答不能時の扱い、運用体制を確認する実務上の例を示しています。

企業による実務記事であり、査読論文、公的規格、認証基準ではありません。チェック項目を検討する補助資料として扱います。

## 3. 資料の使い分け

| 資料 | 主な対象 | アセスメントへの使い方 | 適用上の注意 |
|---|---|---|---|
| RAGAS、ARES | 検索文脈と生成回答の品質 | 関連性、根拠性、回答品質の評価項目を検討する | 業務データや運用準備を判定する枠組みではない |
| GraphRAG-Bench | GraphRAGパイプラインと複雑な質問 | グラフ構築・検索・生成を分けて見る | 業務ごとの合格点や権限準備を定めない |
| Microsoft GraphRAG資料 | GraphRAGの用途、透明性、リスク | 適用する質問の性質、根拠確認、サンプル検証を検討する | 一律の導入判定基準ではない |
| 英国政府ガイド | AI向けデータ準備とガバナンス | データ品質、責任、法務、権限を整理する | RAG専用ではない |
| 実務者ブログ | 導入前に確認する現場項目 | 情報源、権限、更新、抽出、運用の質問候補を得る | 標準や研究上の確立した尺度とは区別する |

## 4. あそぴてっくのアセスメントとの関係

[あそぴてっくのGraphRAG適用アセスメント](../enterprise-data-assessment.md)は、特定の業務にGraphRAGテンプレートを適用する前に、利用者、目的、情報源、保持条件、権限、更新、検索経路などを確認するための質問票です。

質問票の設問は、既存研究からの直接引用でも、既存の準備度標準への適合表明でもありません。RAG / GraphRAGの評価研究・公開ガイドと、本リポジトリの設計資料を参考に、あそぴてっくが業務向けに組み立てた提案です。研究上の品質指標と、業務ごとに決める導入条件や判定基準は、区別して扱います。

