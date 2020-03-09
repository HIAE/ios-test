import XCTest
@testable import ChuckConsumer

class CategoriesTableViewDataHandlerTests: XCTestCase {

    var sut: CategoriesTableViewDataHandler!
    var tableView: UITableView!

    let categories = [
        Category(name: "A"),
        Category(name: "B"),
        Category(name: "C"),
        Category(name: "D"),
        Category(name: "E")
    ]

    override func setUp() {
        tableView = UITableView()
        sut = CategoriesTableViewDataHandler()
        sut.target = tableView
    }

    func testCellRegistration() {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell")
        XCTAssertNotNil(cell)
        XCTAssertTrue(cell! is CategoryCell)
    }

    func testCellsCreated() {
        sut.categories = categories
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 5)

        for number in 0...100 where number != 5 {
            XCTAssertNotEqual(tableView.numberOfRows(inSection: 0), number)
        }
    }

    func testCategorySelection() {
        sut.categories = categories

        let expectedCategory = Category(name: "C")
        let expectedIndexPath = IndexPath(row: 2, section: 0)

        var selectedCategory = Category(name: "XPTO")
        var selectedIndexPath = IndexPath(row: 0, section: 10)

        sut.onSelectCategory = { category, indexPath in
            selectedCategory = category
            selectedIndexPath = indexPath
        }

        sut.tableView(tableView, didSelectRowAt: IndexPath(row: 2, section: 0))

        XCTAssertEqual(selectedIndexPath, expectedIndexPath)
        XCTAssertEqual(selectedCategory, expectedCategory)
    }
}
