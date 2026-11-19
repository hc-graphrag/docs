# RAG / GraphRAGの既存評価研究とデータ準備資料

最終確認日: 2026-11-18

## 調査結果

RAG / GraphRAGには、検索結果や生成回答の品質を測る研究・評価枠組みがあります。また、データのAI利用準備を扱う公的ガイドや、RAG導入前の実務チェックリストも公開されています。

研究で提案された品質指標、公的なデータ準備ガイド、事業者の実務チェックリストは、それぞれ異なる対象と目的を扱います。アセスメントでは、これらを業務成果、ユースケース、保有データに合わせて組み合わせます。

この資料は、既存の評価研究・公開資料の内容と適用範囲を整理します。業務ごとに用いるチェックリストは、[AIエージェント導入のためのユースケース・データ適合アセスメント](../enterprise-data-assessment.md)にまとめています。

## 1. 既存研究のRAG評価枠組み

### RAGAS

[RAGAS: Automated Evaluation of Retrieval Augmented Generation](https://aclanthology.org/2024.eacl-demo.16/) は、検索された文脈の関連性、回答の忠実性、回答の関連性を分けて評価する枠組みです。論文は、参照回答がない状況での自動評価を扱います。

この枠組みは、回答の裏付け、質問への適合、検索文脈の簡潔性を評価する参考になります。業務固有のデータ準備、アクセス権、情報源の責任者、更新・削除は、アセスメントで確認します。

### ARES

[ARES: An Automated Evaluation Framework for Retrieval-Augmented Generation Systems](https://aclanthology.org/2024.naacl-long.20/)（NAACL 2024）は、文脈の関連性、回答の忠実性、回答の関連性を評価します。自動判定モデルに加えて少数の人手評価を利用し、評価の不確かさを扱う方法を提案しています。

人手確認を含めた評価設計の参考になります。各業務の導入条件と合格点は、ユースケースとデータに合わせて定めます。

### GraphRAG-Bench

[GraphRAG-Bench: Challenging Domain-Specific Reasoning for Evaluating Graph Retrieval-Augmented Generation](https://arxiv.org/abs/2506.02404)（2025年公開の研究論文）は、グラフ構築、知識検索、回答生成を含むパイプラインを評価します。複数段階の推論を要する質問などを扱い、最終回答と推論の一貫性を評価対象にしています。

GraphRAGのパイプラインを段階別に評価する参考です。特定業務のデータ権限と運用体制は、ユースケース・データ適合チェックリストで確認します。

### FinDoc-RAG：異種金融文書をまたぐ質問応答

[Assessing RAG System Capabilities on Financial Documents](https://aclanthology.org/2025.finnlp-2.9.pdf)（EMNLP 2025 FinNLP Workshop）は、金融機関の46文書から作成した600件超の質問・回答を使い、事実抽出、数値推論、複数文書の統合を評価しています。論文では、事実抽出と複数文書をまたぐ統合で結果に差が出ることを報告し、質問の種類に応じた評価の必要性を示しています。

文書をまたいで情報を統合する課題がRAGの評価対象として研究されている例です。金融領域以外への適用性は、対象業務のユースケースとデータを使って検証します。

## 2. 公開されているガイドと実務資料

### Microsoft GraphRAGの透明性資料

[Microsoft GraphRAG Responsible AI Transparency Note](https://github.com/microsoft/graphrag/blob/main/RAI_TRANSPARENCY.md) は、複数文書にまたがる情報や全体傾向を問う用途、回答の根拠・出典の確認、人による確認、プロンプトやデータ経由の攻撃、幻覚の評価などを説明しています。独自データでは小さなサンプルで索引処理を確認することも勧めています。

GraphRAGの適用条件とリスクを確認する参考になります。案件ごとの判定は、対象ユースケースと保有データを用いて行います。

### Microsoft FoundryのRAG評価資料

[Retrieval-Augmented Generation Evaluators](https://learn.microsoft.com/en-us/azure/foundry/concepts/evaluation-evaluators/rag-evaluators) は、検索段階と回答段階を分けた評価方法を説明します。検索対象の正解ラベルがある場合の順位指標や、ラベルがない場合のLLM判定などを扱っています。

検索段階と回答段階の評価指標を選ぶ際の実装例として参照します。

### 英国政府のAI向けデータ準備ガイド

[Guidelines and best practices for making government datasets ready for AI](https://www.gov.uk/government/publications/making-government-datasets-ready-for-ai/guidelines-and-best-practices-for-making-government-datasets-ready-for-ai) は、技術的な最適化、データとメタデータの品質、組織・基盤、法務・セキュリティ・倫理を含む観点を示しています。データをAIで利用する前の準備と責任分担を整理する公的資料として参照します。

### AWSにおける提供元承認とアクセス付与

Amazon DataZoneの[データ探索・購読・利用](https://docs.aws.amazon.com/datazone/latest/userguide/discover-subscribe-consume-data.html)では、利用者が理由を添えて購読を申請し、データ所有者が承認または拒否します。承認後は、管理対象の資産についてLake FormationやRedshiftへの権限付与が行われます。[メタデータによる承認ルール](https://docs.aws.amazon.com/datazone/latest/userguide/metadata-rules.html)では、全項目へのアクセスと、行・列を限定したアクセスが区別されています。

この仕組みは、データの発見、業務上の利用承認、技術的な権限付与を別の段階として記録する例です。アセスメントでは、利用理由、承認者、対象範囲、付与先、有効期限を対応付けます。

### AWSにおける加工ジョブと派生データの権限

AWS IAMの[一時的なセキュリティ認証情報](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp.html)は、委任やクロスアカウントアクセスで期間を限定した権限を提供します。AWS Glueの[ETLジョブに必要なIAM権限](https://docs.aws.amazon.com/glue/latest/dg/getting-started-min-privs-job.html)では、処理ロールに入力元の読取、出力先の書込、一時領域、暗号鍵への権限が必要であることを示しています。

AWS Lake Formationの[権限モデル](https://docs.aws.amazon.com/lake-formation/latest/dg/lf-permissions-overview.html)は、データカタログのメタデータ権限と、S3上の実データへの権限を区別し、IAMとLake Formationの双方の確認を要求します。[データロケーション権限](https://docs.aws.amazon.com/lake-formation/latest/dg/access-control-underlying-data.html)は、表を作成・変更する権限と、その表が参照する保存場所の権限を分けています。

これらは、元データを読める主体、加工を実行する主体、派生データを書き込む場所、索引を更新する主体を工程ごとに確認する根拠になります。

### W3C PROV-Oによる加工履歴の表現

[PROV-O](https://www.w3.org/TR/prov-o/)は、データなどのEntity、変換を行うActivity、責任を持つAgentを区別し、used、wasGeneratedBy、wasDerivedFromなどで来歴を表します。

元データ、加工処理、派生データ、実行主体を連結して記録することで、GraphRAGの索引、実体・関係、要約、コンテキストがどの情報と処理から生成されたかを追跡できます。

### Microsoft ResearchのBenchmarkQED記事

[BenchmarkQED: Automated benchmarking of RAG systems](https://www.microsoft.com/en-us/research/blog/benchmarkqed-automated-benchmarking-of-rag-systems/) は、GraphRAGを含むRAG方式の比較例を紹介しています。全体質問に対する回答の網羅性、多様性、理解・判断への有用性、質問への関連性を評価しています。

これは特定のデータセット、質問、モデルで行った比較の紹介です。評価軸の例として読めますが、その結果や順位を別の業務へ一般化することはできません。

### 実務者によるデータ準備チェックリスト

[Enterprise Data Preparation for RAG: Readiness Guide](https://www.lucentinnovation.com/resources/it-insights/architecting-enterprise-data-for-rag-success) は、業務範囲、情報源の責任者、文書抽出、メタデータ、アクセス権、更新・削除、検索、回答不能時の扱い、運用体制を確認する実務上の例を示しています。

企業による実務記事として、チェック項目を検討する補助資料に使用します。研究上の品質指標と公的ガイドも併せて参照します。

## 3. 資料の使い分け

| 資料 | 主な対象 | アセスメントへの使い方 | 組み合わせる確認 |
|---|---|---|---|
| RAGAS、ARES | 検索文脈と生成回答の品質 | 関連性、根拠性、回答品質の評価項目を検討する | 業務データと運用準備を別途確認する |
| GraphRAG-Bench | GraphRAGパイプラインと複雑な質問 | グラフ構築・検索・生成を分けて見る | 業務ごとの合格点と権限準備を定める |
| Microsoft GraphRAG資料 | GraphRAGの用途、透明性、リスク | 適用する質問の性質、根拠確認、サンプル検証を検討する | 対象ユースケースと保有データで判定する |
| 英国政府ガイド | AI向けデータ準備とガバナンス | データ品質、責任、法務、権限を整理する | RAG固有の取得・生成評価を組み合わせる |
| Amazon DataZone | データ提供元の承認とアクセス付与 | 利用理由、承認者、範囲、付与先を分けて記録する | 実際のクラウド資源と権限設定を確認する |
| AWS IAM、Glue、Lake Formation | 一時権限、加工ジョブ、保存場所、カタログと実データ | 処理工程ごとの実行主体と入出力権限を確認する | 派生データの所有・保持・削除条件を定める |
| W3C PROV-O | 元データ、加工活動、派生データ、責任主体 | 変換と生成物の来歴を記録する | 承認・技術権限の記録を組み合わせる |
| 実務者ブログ | 導入前に確認する現場項目 | 情報源、権限、更新、抽出、運用の質問候補を得る | 研究上の品質指標と公的ガイドを組み合わせる |

## 4. 設計資料での利用

既存研究と公開ガイドから得た観点は、用途に応じて設計資料へ引き渡します。

| 調査対象 | 反映先 |
|---|---|
| RAGAS、ARES、GraphRAG-Bench | [段階別評価方式](../evaluation.md)の測定項目 |
| Microsoft GraphRAGの透明性資料 | [AIエージェント・GraphRAGシステム導入支援の進め方](../graphrag-delivery-model.md)の確認事項 |
| データ準備ガイド | [ユースケース・データ適合アセスメント](../enterprise-data-assessment.md)の判断根拠 |
| Amazon DataZone、AWS IAM、Glue、Lake Formation | 同資料のデータ配置・権限フローと[システムモデル](../rag-system-model.md)の処理境界 |
| W3C PROV-O | [情報変換の原理](../information-compression-and-context-injection.md)の来歴・派生データモデル |
| 実務チェックリスト | アセスメント時の確認資料 |

業務ごとの判定には、対象ユースケース、実データ、利用条件を使用します。
