# Gender Rewriting Shared Task

The Gender Rewriting Shared Task will take place at the Seventh Arabic Natural Language Processing Workshop (WANLP 2022) at EMNLP 2022.

Please join our [Slack workspace](https://genderrewriting.slack.com/) and [Google Group](https://groups.google.com/g/gender-rewriting) to stay up to date. If you have any questions, feel free to [email](mailto:gender.rewriting.organizers@gmail.com) the organizers.

***Click here to [register for the shared task](https://docs.google.com/forms/d/e/1FAIpQLSfw45B_oH2eKh9R_JROviQj292ef93zR0dqza4SBr3myh1Ogw/viewform)!***


## Task Description:

The task of gender rewriting refers to generating alternatives of a given sentence to match different target user gender contexts (e.g., female speaker with a male listener, a male speaker with a male listener, etc.). This requires changing the grammatical gender (masculine or feminine) of certain words referring to the users (speaker/1st person and listener/2nd person). In this task, we focus on Arabic, a gender-marking morphologically rich language. The task of gender rewriting was introduced by [Alhafni et al. (2022)](https://arxiv.org/pdf/2205.02211.pdf).


## Data:

All participating teams will use the publicly available [Arabic Parallel Gender Corpus v2.1](https://camel.abudhabi.nyu.edu/arabic-parallel-gender-corpus/) to train and test their systems. Participants are not allowed to use external manually labeled datasets, but they can leverage unlabeled data to create synthetic examples (i.e., data augmentation). A blind test set will be used to evaluate the outputs of participating teams. All teams are required to report on the development and test sets in their write ups.


## Evaluation:

We will treat the task of gender rewriting as a user-aware grammatical error task and use the [M2 Scorer](https://aclanthology.org/N12-1067.pdf) as the evaluation metric. The M2 Scorer computes the Precision, Recall, and F0.5 of the word-level edits between the input and the rewritten output against the gold edits. We provide instructions on how to run the evaluation script below.<br/>

### Requirements:

You will need to have [conda](https://docs.conda.io/en/latest/miniconda.html) installed. To setup the environment, you would need to run:

```bash
git clone https://github.com/CAMeL-Lab/gender-rewriting-shared-task.git
cd gender-rewriting-shared-task

bash scripts/create_envs.sh

conda activate gender_rewriting

pip install -r requirements.txt
```

To run the m2scorer evaluation, you will also need to download the m2 files edits we have prepared for the dev and the test sets of the Arabic Parallel Gender Corpus. The m2 files are provided in this [release](https://github.com/CAMeL-Lab/gender-rewriting-shared-task/releases/tag/m2_edits).

### Running the Evaluation:
Your system should generate ***four*** output files. Each one of those output files represents the target gender context you are modeling: 

1. **Target MM**: Masculine first person and masculine second person.
2. **Target FM**: Feminine first person and masculine second person.
3. **Target MF**: Masculine first person and feminine second person.
4. **Target FF**: Feminine first person and masculine second person.

Once you have the four outputs, place them in a single directory and name them respectively as: **arin.to.MM**, **arin.to.FM**, **arin.to.MF**, and **arin.to.FF**. Since the Arabic Parallel Gender Corpus v2.1 is balanced by design, all of the four files should have the same number of sentences. The [output_example](output_example/) folder shows how the files should look like when you run your system on the dev set.<br/><br/>

To run the m2scorer on your system's output, you would need to run:

```bash
bash scripts/eval.sh /path/to/outputs /path/to/m2_files [dev|test]
```

For example, to run the evaluation over the provided dev set example outputs, you would run:

```bash
bash scripts/eval.sh output_example m2_edits dev
```

The expected output should be:

```
Precision   : 0.8846
Recall      : 0.8674
F_0.5       : 0.8811
```

## Organizers

[Bashar Alhafni](https://basharalhafni.com/)

[Ossama Obeid](https://nyuad.nyu.edu/en/research/faculty-labs-and-projects/computational-approaches-to-modeling-language-lab/researchers/ossama-obeid.html)

[Houda Bouamor](https://www.andrew.cmu.edu/user/hbouamor/)

[Nizar Habash](https://www.nizarhabash.com/)

## License
This repo is available under the MIT license. See the [LICENSE](LICENSE) for more info.

## References

1. [User-Centric Gender Rewriting](https://arxiv.org/pdf/2205.02211.pdf). Alhafni, Bashar, Nizar Habash, Houda Bouamor. 2022. In Proceedings of the 2022 Conference of the North American Chapter of the Association for Computational Linguistics, Seattle, Washington.

2. [The Arabic Parallel Gender Corpus 2.0: Extensions and Analyses](https://arxiv.org/pdf/2110.09216.pdf). Alhafni, Bashar, Nizar Habash, Houda Bouamor. 2022. In Proceedings of the 13th Language Resources and Evaluation Conference (LREC), Marseille, France.

