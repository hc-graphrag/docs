# あそぴてっくのAIエージェント導入・GraphRAG適用ガイド

このリポジトリはあそぴてっくのAIエージェント導入支援に関する公開資料です。お客様の業務課題からユースケースを定め、保有データと利用条件の適合性を確認する考え方をご案内いたします。

技術基盤として、[Microsoft Researchが研究・開発するGraphRAG](https://www.microsoft.com/en-us/research/project/graphrag/)をご提案申し上げます。

## ご相談から導入まで

お客様が得たい業務成果と、AIエージェントに行わせたいユースケースを伺います。保有データと利用条件の適合性を確認し、その結果に基づいてGraphRAGの適用をご提案申し上げます。合意した範囲に基づき、AIエージェントを含むシステム全体を設計・実装し、テストと引き渡しまで担当いたします。

## このリポジトリでご確認いただけること

- 業務課題、期待成果、ユースケース、保有データ、利用条件の適合性を判断するアセスメント
- AIエージェントの行動へコンテキストを供給するRAGシステムモデルと設計原則
- AIエージェントを含むシステム全体の開発工程、成果物、受入時点
- 行動完了、根拠、費用、遅延を評価する方法と実証計画
- 技術的な主張と適用条件を支える一次資料・研究

## 読み始める場所

- システム構成: [AIエージェント向けRAGシステムモデル](rag-system-model.md)
- 上位原理: [情報圧縮・階層化・復元・コンテキスト注入の原理](information-compression-and-context-injection.md)
- 適用判断: [AIエージェント導入のためのユースケース・データ適合アセスメント](enterprise-data-assessment.md)
- 開発・導入工程: [AIエージェント・GraphRAGシステム導入支援の進め方](graphrag-delivery-model.md)
- 調査根拠: [AIエージェント向けRAGの設計根拠](research/agent-context-and-data-fitness.md)
- 評価方法: [段階別評価方式](evaluation.md)
- 全資料: [資料一覧](INDEX.md)

## 実装と検証コード

実行可能な検証コードを [hc-graphrag/rag-usecase-demos](https://github.com/hc-graphrag/rag-usecase-demos)、GraphRAG実装を [hc-graphrag/llamaindex-python](https://github.com/hc-graphrag/llamaindex-python) で公開しています。

## スポンサーの方へ：GraphRAGの資料は非公開リポジトリでまとめて読めます

このリポジトリのGraphRAG資料は、どなたでもお読みいただけます。[GitHub Sponsors](https://github.com/sponsors/asopitech) の先行閲覧プランをご利用の方は、プランに応じた限定資料を非公開リポジトリでご覧いただけます。

このリポジトリの公開資料もすべて、各先行閲覧プランの非公開リポジトリに同期します。限定資料も公開資料も、ご利用中のプランの非公開リポジトリでまとめて確認できます。公開リポジトリを別に追う必要はありません。
