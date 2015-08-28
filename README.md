
## Task #2

>К Вашему выполненному заданию 1 необходимо добавить следующий функционал:
Смена вида представления данных - добавить возможность переключения между UITableView и UICollectionView. В UICollectionViewCell необходимо отображать только картинку в весь размер ячейки, что-то вроде этого http://www.appcoda.com/wp-content/uploads/2013/01/RecipePhoto-App-First-Version.jpg
Хранить данные моделей в plist-файле
Добавить возможность добавлять новые элементы - пользователь может ввести текст для новой модели, этот текст не может быть короче трех символов. Картинку пока не выбыраем. Модель сохраняется в plist. После сохранения модели она должна добавиться в plist и отобразиться в таблице и collection view. 


###Project Structure

![alt tag](https://raw.githubusercontent.com/YAInternship2015/AndrewPetrovTask1/master/Task2ClassesDiagram.png)



## Task #1

>Написать приложение, в котором будет один экран с таблицей (UITableViewController). В таблице каждая ячейка (UITableViewCell) должна содержать следующую информацию:  картинка (UIImageView) и справа от нее текст (UILabel). В таблице должно быть 10 ячеек высотой 80 пикселей.  В качестве картинки показать любую картинку добавленную в проект и в качестве текста показать любой текст, но они должны быть разными для каждой ячейки.  Экран должен быть создан в Storyboard с использованием Autolayout.

Test app displays list of 10 musical instruments.

###Model


*APInstrument* object represents musical instrument

*APInstrumentsManager* plays role of some data provider it allows to generate list of instruments

###UI
*APTableViewCell* present musical instrument (*APInstrument*) in table
