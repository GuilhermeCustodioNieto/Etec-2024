import java.util.ArrayList;
import java.util.Arrays;

public class Challenge {
    public static void main(String[] args) {
        var grid = AL(
                "   ",
                " h<",
                "  ^"
        );
        var expected = AL(
                AL(1, 1),
                AL(2, 1),
                AL(2, 2)
        );

        findSnakeOnGrid(grid);
    }

    public static ArrayList<ArrayList<Integer>> findSnakeOnGrid(ArrayList<String> grid) {

        ArrayList<ArrayList<Integer>> finalPositions = new ArrayList<ArrayList<Integer>>();
        ArrayList<Integer> lastPosition = findHead(grid);
        finalPositions.add(lastPosition);
        while(lastPosition.get(0) != -1){
            ArrayList<ArrayList<Integer>> arround = getArround(lastPosition, grid);
            System.out.println(arround);
            System.out.println(lastPosition);
            System.out.println("*******************");
            arround = removeLastPosition(lastPosition, arround);
            lastPosition = getCoordinates(arround, grid);
            if(lastPosition.get(0) == -1){
                break;
            }
            finalPositions.add(lastPosition);
        }

        System.out.println(finalPositions);

        return finalPositions;
    }

    public static ArrayList<Integer> findHead(ArrayList<String> grid){
        for(int i=0;i<=grid.size(); i++){
            int position = grid.get(i).indexOf("h");

            if(position != -1){
                System.out.println(i);
                System.out.println(position);
                return new ArrayList<>(Arrays.asList(position, i));
            }
        }

        return new ArrayList<Integer>();
    }

    public static ArrayList<ArrayList<Integer>> getArround(ArrayList<Integer> lastPosition, ArrayList<String> grid) {
        ArrayList<ArrayList<Integer>> arround = new ArrayList<ArrayList<Integer>>();

        lastPosition = new ArrayList<>(Arrays.asList(lastPosition.get(1),lastPosition.get(0)));



        if(lastPosition.get(0) == 0 && lastPosition.get(1) == 0){ // pega o da primeira linha a esqueda
            arround.add(new ArrayList<>(Arrays.asList(0,1)));
            arround.add(new ArrayList<>(Arrays.asList(1,0)));
        } else if(lastPosition.get(0) == 0 && lastPosition.get(1) == grid.get(0).length() - 1){ // pega o da primeira linha a direita
            arround.add(new ArrayList<>(Arrays.asList(0,grid.size() - 2)));
            arround.add(new ArrayList<>(Arrays.asList(1,grid.size() - 1)));
        } else if(lastPosition.get(0) == 0){ // pega o da primeira linha ao meio
            arround.add(new ArrayList<>(Arrays.asList(0, lastPosition.get(1) + 1)));
            arround.add(new ArrayList<>(Arrays.asList(0, lastPosition.get(1) - 1)));
            arround.add(new ArrayList<>(Arrays.asList(1, lastPosition.get(1))));
        } else if(lastPosition.get(0) == grid.size() && lastPosition.get(1) == 0){ // pega o da ultima lina a esquerda
            arround.add(new ArrayList<>(Arrays.asList(lastPosition.get(0), lastPosition.get(1) + 1)));
            arround.add(new ArrayList<>(Arrays.asList(lastPosition.get(0) - 1, lastPosition.get(1))));
        } else if(lastPosition.get(0) == grid.size() - 1 && lastPosition.get(1) == grid.get(0).length() - 1){ // pega o da ultima linha a direita
            arround.add(new ArrayList<>(Arrays.asList(lastPosition.get(0) - 1, grid.get(0).length() - 1)));
            arround.add(new ArrayList<>(Arrays.asList(lastPosition.get(0), lastPosition.get(1) - 1)));
        } else if(lastPosition.get(0) == grid.size()){ // pega o da ultima linha ao meio
            arround.add(new ArrayList<>(Arrays.asList(lastPosition.get(0) -1, grid.get(0).length() - 1)));
            arround.add(new ArrayList<>(Arrays.asList(lastPosition.get(0), lastPosition.get(1) - 1)));
            arround.add(new ArrayList<>(Arrays.asList(lastPosition.get(0) + 1, lastPosition.get(1))));
        } else if(lastPosition.get(1) == 0){ // pega do de qualquer linha do "meio" a esquerda
            arround.add(new ArrayList<>(Arrays.asList(lastPosition.get(0) + 1, lastPosition.get(1))));
            arround.add(new ArrayList<>(Arrays.asList(lastPosition.get(0) - 1, lastPosition.get(1))));
            arround.add(new ArrayList<>(Arrays.asList(lastPosition.get(0), lastPosition.get(1) + 1)));
        } else if(lastPosition.get(1) == grid.get(0).length() - 1){ // pega do de qualquer linha do "meio" a direita
            arround.add(new ArrayList<>(Arrays.asList(lastPosition.get(0) + 1, lastPosition.get(1))));
            arround.add(new ArrayList<>(Arrays.asList(lastPosition.get(0) - 1, lastPosition.get(1))));
            arround.add(new ArrayList<>(Arrays.asList(lastPosition.get(0), lastPosition.get(1) - 1)));
        } else { // pega tudo ao redor de um valor que está no centro
            arround.add(new ArrayList<>(Arrays.asList(lastPosition.get(0) + 1, lastPosition.get(1))));
            arround.add(new ArrayList<>(Arrays.asList(lastPosition.get(0) - 1, lastPosition.get(1))));
            arround.add(new ArrayList<>(Arrays.asList(lastPosition.get(0), lastPosition.get(1) - 1)));
            arround.add(new ArrayList<>(Arrays.asList(lastPosition.get(0), lastPosition.get(1) + 1)));
        }


        return arround;
    }

    public static ArrayList<Integer> getCoordinates(ArrayList<ArrayList<Integer>> arround, ArrayList<String> grid){
        for(ArrayList<Integer> line : arround){
            char value = grid.get(line.get(1)).charAt(line.get(0));
            if(value == '>' || value == '<'){
                return new ArrayList<>(Arrays.asList(line.get(0), line.get(1)));
            } else if(value == '^' || value == 'v'){
                return new ArrayList<>(Arrays.asList(line.get(0), line.get(1)));
            }
        }
        return new ArrayList<>(Arrays.asList(-1, -1));
    }

    public static ArrayList<ArrayList<Integer>> removeLastPosition(ArrayList<Integer> lastPosition, ArrayList<ArrayList<Integer>> arround){
        for(int i=0; i<=arround.size() - 1;i++){
            if(arround.get(i).get(0) == lastPosition.get(0) && arround.get(i).get(1) == lastPosition.get(1)){
                arround.remove(i);
                System.out.println(arround);
                return arround;
            }

        }

        return arround;
    }

    public static <T> ArrayList<T> AL(T ...a) {
        return new ArrayList<T>(Arrays.asList(a));
    }
}