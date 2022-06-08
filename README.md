# Gender Rewriting Shared Task

The Gender Rewriting Shared Task will take place at the Seventh Arabic Natural Language Processing Workshop (WANLP 2022) at EMNLP 2022.

Please join our [Slack workspace](https://genderrewriting.slack.com/) and [Google Group](https://groups.google.com/g/gender-rewriting) to stay up to date. If you have any questions, feel free to [email](mailto:gender.rewriting.organizers@gmail.com) the organizers.

***Click here to [register for the shared task](https://docs.google.com/forms/d/e/1FAIpQLSfw45B_oH2eKh9R_JROviQj292ef93zR0dqza4SBr3myh1Ogw/viewform)!***


## Task Description:

The task of gender rewriting refers to generating alternatives of a given sentence to match different target user gender contexts (e.g., female speaker with a male listener, a male speaker with a male listener, etc.). This requires changing the grammatical gender (masculine or feminine) of certain words referring to the users (speaker/1st person and listener/2nd person). In this task, we focus on Arabic, a gender-marking morphologically rich language. The task of gender rewriting was introduced by [Alhafni et al. (2022)](XX).


## Data:

All participating teams will use the publicly available [Arabic Parallel Gender Corpus v2.1](XYZ) to train and test their systems. Participants are not allowed to use external manually labeled datasets, but they can leverage unlabeled data to create synthetic examples (i.e., data augmentation). A blind test set will be used to evaluate the outputs of participating teams. All teams are required to report on the development and test sets in their write ups.


## Evaluation:

We will treat the task of gender rewriting as a user-aware grammatical error task and use the [M2 Scorer](XX) as the evaluation metric. The [M2 Scorer](XX) computes the Precision, Recall, and F0.5 of the word-level edits between the input and the rewritten output against the gold edits. We provide instructions on how to run the evaluation script below.<br/>

### Installation Requirements:

You will need to have [conda](https://docs.conda.io/en/latest/miniconda.html) installed. To setup the environment, you would need to run:
```
git clone https://github.com/balhafni/gender-rewriting-shared-task.git
cd gender-rewriting-shared-task

bash scripts/create_envs.sh

conda activate gender_rewriting

pip install -r requirements.txt
```



