using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ccdll
{
    public class CardCheck
    {
        private string _cardnum;

        // Constructor to initialize the card number
        public CardCheck(string cardnum)
        {
            _cardnum = cardnum;
        }
        public string GetCardCompany(string cardNumber)
        {
            if (ValidCardNum(cardNumber))
            {


                if (string.IsNullOrEmpty(cardNumber))
                    return "Invalid card number";

                if (cardNumber.StartsWith("4"))
                    return "Visa";
                else if (cardNumber.StartsWith("51") || cardNumber.StartsWith("52") ||
                         cardNumber.StartsWith("53") || cardNumber.StartsWith("54") ||
                         cardNumber.StartsWith("55") ||
                         (int.Parse(cardNumber.Substring(0, 4)) >= 2221 &&
                          int.Parse(cardNumber.Substring(0, 4)) <= 2720))
                    return "MasterCard";
                else if (cardNumber.StartsWith("34") || cardNumber.StartsWith("37"))
                    return "American Express";
                else if (cardNumber.StartsWith("6011") || cardNumber.StartsWith("65") ||
                         (int.Parse(cardNumber.Substring(0, 3)) >= 644 &&
                          int.Parse(cardNumber.Substring(0, 3)) <= 649))
                    return "Discover";
                else if ((int.Parse(cardNumber.Substring(0, 3)) >= 300 &&
                          int.Parse(cardNumber.Substring(0, 3)) <= 305) ||
                         cardNumber.StartsWith("36") || cardNumber.StartsWith("38"))
                    return "Diners Club";
                else if (cardNumber.StartsWith("35"))
                    return "JCB";
                else if (cardNumber.StartsWith("5018") || cardNumber.StartsWith("5020") ||
                         cardNumber.StartsWith("5038") || cardNumber.StartsWith("5893") ||
                         cardNumber.StartsWith("6304") || cardNumber.StartsWith("6759") ||
                         cardNumber.StartsWith("6761") || cardNumber.StartsWith("6762"))
                    return "Maestro";

                return "Unknown card company";
            }

            else
            {
                return "Inavlid Card Number";
            }
        }

        public bool ValidCardNum(string cardNo)
        {
            {
                //int cardNo = Int32.Parse(cardNumber.Trim());
                int nDigits = cardNo.Length;

                int nSum = 0;
                bool isSecond = false;
                for (int i = nDigits - 1; i >= 0; i--)
                {

                    int d = cardNo[i] - '0';

                    if (isSecond == true)
                        d = d * 2;

                    // We add two digits to handle
                    // cases that make two digits 
                    // after doubling
                    nSum += d / 10;
                    nSum += d % 10;

                    isSecond = !isSecond;
                }
                return (nSum % 10 == 0);
            }
        }

    }
}

